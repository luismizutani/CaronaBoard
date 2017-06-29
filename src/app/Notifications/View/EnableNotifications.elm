module Notifications.View.EnableNotifications exposing (enableNotifications)

import Common.CssHelpers exposing (materializeClass)
import Common.Form exposing (loadingOrSubmitButton, renderErrors)
import Common.Icon exposing (icon)
import Common.Response exposing (Response(..))
import Layout.Styles exposing (Classes(..), layoutClass)
import Notifications.Model exposing (Model, Msg(..))
import Testable.Html exposing (..)
import Testable.Html.Attributes exposing (disabled, id)
import Testable.Html.Events exposing (onSubmit)


enableNotifications : Model -> Html Msg
enableNotifications model =
    div [ materializeClass "container" ]
        [ h1 [ layoutClass PageTitle ] [ text "Ativar Notificações" ]
        , form [ materializeClass "card", onSubmit EnableNotifications ]
            [ div [ materializeClass "card-content" ]
                [ case model.response of
                    Error _ ->
                        renderErrors (Error "As notificações não foram ativadas")

                    _ ->
                        div [] []
                , p [] [ text "Sua oferta de carona foi cadastrada!" ]
                , br [] []
                , p [] [ text "Agora você precisa ativar as notificações para ficar sabendo quando alguém te pedir uma carona" ]
                , br [] []
                , case model.response of
                    Success _ ->
                        button [ disabled True, layoutClass SubmitButton, materializeClass "waves-effect waves-light btn-large" ]
                            [ div [ layoutClass ButtonContainer ] [ icon "done", text "Notificações ativadas" ] ]

                    _ ->
                        loadingOrSubmitButton model.response [ id "enableNotifications", layoutClass SubmitButton ] [ text "Ativar Notificações" ]
                ]
            ]
        ]
