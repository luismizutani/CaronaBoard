port module GiveRide.Ports exposing (giveRide, subscriptions)

import Common.Response exposing (FirebaseResponse)
import GiveRide.Model exposing (NewRide)
import GiveRide.Msg exposing (Msg(..))
import Rides.Model exposing (Ride)


subscriptions : Sub Msg
subscriptions =
    Sub.batch
        [ giveRideResponse GiveRideResponse
        ]


port giveRide : NewRide -> Cmd msg


port giveRideResponse : (FirebaseResponse Ride -> msg) -> Sub msg