module Login.Model exposing (Model, Msg(..), Step(..), User, isLoggedIn, loggedInUser, step)

import Common.Response exposing (FirebaseResponse, Response(..))
import Profile.Model exposing (Profile)


type alias Model =
    { email : String
    , password : String
    , registered : Response Bool
    , loggedIn : Response User
    , passwordReset : Response ()
    , signUp : Response Bool
    }


type alias User =
    { id : String }


type Step
    = EmailStep
    | NotRegisteredStep
    | PasswordStep


type Msg
    = UpdateEmail String
    | UpdatePassword String
    | Submit
    | CheckRegistrationResponse Bool
    | SignInResponse (FirebaseResponse { user : User, profile : Maybe Profile })
    | SignOut
    | SignOutResponse
    | PasswordReset
    | PasswordResetResponse (Maybe Error)
    | SignUpResponse (FirebaseResponse Bool)


type alias Error =
    String


step : Model -> Step
step model =
    case model.registered of
        Success True ->
            PasswordStep

        Success False ->
            NotRegisteredStep

        _ ->
            EmailStep


loggedInUser : Model -> Maybe User
loggedInUser model =
    case model.loggedIn of
        Success user ->
            Just user

        _ ->
            Nothing


isLoggedIn : Model -> Bool
isLoggedIn model =
    case loggedInUser model of
        Just _ ->
            True

        Nothing ->
            False
