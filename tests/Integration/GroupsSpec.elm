module Integration.GroupsSpec exposing (loadGroups, tests)

import Expect
import Groups.Ports exposing (..)
import Helpers exposing (expectToContainText, fixtures, initialContext, jsonQuotes, signedInContext, someUser, toLocation)
import JsonStringify exposing (simpleStringify)
import Model as Root exposing (Model, Msg(..))
import Test exposing (..)
import Test.Html.Event exposing (click, submit)
import Test.Html.Query exposing (..)
import Test.Html.Selector exposing (..)
import TestContext exposing (..)
import UrlRouter.Routes exposing (Page(..), toPath)


tests : Test
tests =
    describe "Groups"
        [ test "request groups list when going to the page" <|
            groupsContext
                >> expectCmd (groupsList ())
        , test "shows loading when the groups are loading" <|
            groupsContext
                >> expectView
                >> has [ text "Carregando..." ]
        , test "renders groups when they load" <|
            groupsContext
                >> loadGroups
                >> expectView
                >> Expect.all
                    [ has [ tag "li", text "winona riders" ]
                    , has [ tag "li", text "the uber killars" ]
                    ]
        , test "goes the the group's rides when clicking on it" <|
            groupsContext
                >> loadGroups
                >> simulate (find [ id "idGroup1" ]) click
                >> expectModel
                    (\model ->
                        Expect.equal (RidesListPage "idGroup1") model.urlRouter.page
                    )
        , test "goes to a page requesting to join the group if the user is not a member" <|
            groupsContext
                >> loadGroups
                >> simulate (find [ id "idGroup2" ]) click
                >> expectView
                >> has [ text "Participar do grupo" ]
        , describe "details"
            [ test "shows loading when the groups are loading" <|
                groupsContext
                    >> navigate (toPath <| GroupDetailsPage "idGroup2")
                    >> expectView
                    >> has [ text "Carregando..." ]
            , test "renders group details after loading" <|
                groupDetailsContext
                    >> expectView
                    >> has [ text fixtures.group2.name ]
            , test "renders a 404 if the group was not found" <|
                groupsContext
                    >> navigate (toPath <| GroupDetailsPage "nan")
                    >> loadGroups
                    >> expectView
                    >> has [ text "404 não encontrado" ]
            , test "asks for joining the group" <|
                groupDetailsContext
                    >> simulate (find [ tag "form" ]) submit
                    >> Expect.all
                        [ expectView >> has [ text "Carregando..." ]
                        , expectCmd (Cmd.map MsgForGroups <| Groups.Ports.createJoinGroupRequest { groupId = "idGroup2" })
                        ]
            , test "shows that the join request was sent" <|
                groupDetailsContext
                    >> simulate (find [ tag "form" ]) submit
                    >> send createJoinGroupRequestResponse { groupId = "idGroup2", response = ( Nothing, Just <| simpleStringify True ) }
                    >> expectView
                    >> has [ text "Pedido enviado!" ]
            ]
        , describe "group join requests"
            [ test "shows the join requests" <|
                groupsContext
                    >> loadGroups
                    >> simulate (find [ id "idGroup1" ]) click
                    >> expectView
                    >> has [ text fixtures.profile.name ]
            ]
        ]


loadGroups : TestContext model msg -> TestContext model msg
loadGroups =
    let
        group1 =
            fixtures.group1

        group2 =
            fixtures.group2

        group1Denormalized =
            { group1
                | members =
                    { idUser1 = { admin = True }
                    }
                , joinRequests =
                    { idUser2 = { profile = fixtures.profile }
                    }
            }

        group2Denormalized =
            { name = group2.name }
    in
    send groupsListResponse
        ( Nothing
        , Just <|
            simpleStringify
                { idGroup1 = group1Denormalized
                , idGroup2 = group2Denormalized
                }
        )


groupsContext : a -> TestContext Model Root.Msg
groupsContext =
    signedInContext GroupsListPage


groupDetailsContext : a -> TestContext Model Root.Msg
groupDetailsContext =
    groupsContext
        >> navigate (toPath <| GroupDetailsPage "idGroup2")
        >> loadGroups
