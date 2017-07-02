module Rides.Ride.Update exposing (init, update)

import Common.Response exposing (Response(..))
import Profile.Update
import Rides.Ride.Model exposing (Model, Msg(..))
import Rides.Ride.Ports exposing (encodeRide, rideRequest)


init : Model
init =
    { id = ""
    , userId = ""
    , origin = ""
    , destination = ""
    , days = ""
    , hours = ""
    , profile = (Profile.Update.init Nothing).fields
    , rideRequest = Empty
    }


update : Rides.Ride.Model.Msg -> Model -> ( Model, Cmd.Cmd Rides.Ride.Model.Msg )
update msg model =
    case msg of
        Submit ->
            ( { model | rideRequest = Loading }
            , rideRequest <| encodeRide model
            )

        RideRequestResponse response ->
            ( { model | rideRequest = response }, Cmd.none )