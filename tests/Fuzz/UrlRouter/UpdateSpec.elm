module Fuzz.UrlRouter.UpdateSpec exposing (..)

import Array exposing (Array, fromList, get, length)
import Expect exposing (equal)
import Fuzz exposing (Fuzzer)
import Helpers exposing (fixtures, someUser, toLocation)
import Login.Model
import Login.Update
import Navigation exposing (Location)
import Profile.Model
import Profile.Update
import Return exposing (return)
import Test exposing (..)
import UrlRouter.Routes exposing (Page(..), pathParser, redirectTo, requiresAuthentication, toPath)
import UrlRouter.Update exposing (changePageTo)


tests : Test
tests =
    describe "Fuzz UrlRouter"
        [ describe "changePageTo"
            [ fuzz3 randomPage randomLogin randomPage "returns the requested page redirect unless the current page, the requested one and the redirect to are all the same" <|
                \currentPage login requestedPage ->
                    let
                        pageAfterRedirect =
                            redirectTo Nothing profileSample login requestedPage

                        pageToGo =
                            changePageTo profileSample login { page = currentPage, returnTo = Nothing } (toLocation requestedPage)

                        returnTo =
                            if requiresAuthentication requestedPage then
                                Just requestedPage
                            else
                                Nothing

                        expectedReturn =
                            if pageAfterRedirect /= requestedPage then
                                return { page = pageAfterRedirect, returnTo = returnTo } <|
                                    Navigation.modifyUrl (toPath pageAfterRedirect)
                            else
                                return { page = pageAfterRedirect, returnTo = Nothing } Cmd.none
                    in
                    Expect.equal expectedReturn pageToGo
            , fuzz2 randomLogin randomPath "returns 404 for random paths" <|
                \login randomPath ->
                    let
                        pageToGo =
                            changePageTo profileSample login { page = SplashScreenPage, returnTo = Nothing } (pathToLocation randomPath)

                        expectedReturn =
                            return { page = NotFoundPage, returnTo = Nothing } Cmd.none
                    in
                    Expect.equal expectedReturn pageToGo
            ]
        ]


profileSample : Profile.Model.Model
profileSample =
    Profile.Update.init (Just fixtures.profile)


pages : Array Page
pages =
    fromList [ SplashScreenPage, LoginPage, GroupsListPage, NotFoundPage ]


randomPage : Fuzzer Page
randomPage =
    Fuzz.intRange 0 (length pages - 1)
        |> Fuzz.map (\index -> get index pages)
        |> Fuzz.map (Maybe.withDefault NotFoundPage)


pathToLocation : String -> Location
pathToLocation path =
    { href = "", host = "", hostname = "", protocol = "", origin = "", port_ = "", pathname = "", search = "", hash = path, username = "", password = "" }


randomLogin : Fuzzer Login.Model.Model
randomLogin =
    Fuzz.map
        (\bool ->
            if bool then
                Login.Update.init someUser
            else
                Login.Update.init Nothing
        )
        Fuzz.bool


randomPath : Fuzzer String
randomPath =
    Fuzz.map
        (\path ->
            if pathParser (pathToLocation path) == Just SplashScreenPage then
                "foo"
            else
                path
        )
        Fuzz.string
