module Notifications.View.Notice exposing (notice)

import Model exposing (Model, Msg)
import Notifications.Styles exposing (Classes(..), className)
import Html exposing (Html, div, text)


notice : Model -> Html Msg
notice model =
    case model.notifications.notice of
        Just notification ->
            div [ className NoticeVisible ] [ text notification ]

        Nothing ->
            div [ className NoticeHidden ] []
