module Groups.View.List exposing (list)

import Common.Response exposing (Response(..))
import Groups.Model exposing (Group, Model)
import Groups.Styles exposing (Classes(..), className)
import Html exposing (..)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)
import Layout.Styles exposing (Classes(..), layoutClass)
import Model as Root exposing (Msg(..))
import UrlRouter.Model exposing (Msg(..))
import UrlRouter.Routes exposing (Page(..))


list : Model -> Html Root.Msg
list model =
    case model.groups of
        Empty ->
            text ""

        Loading ->
            text "Carregando..."

        Success groups ->
            div []
                [ div [ layoutClass Container ]
                    [ h1 [ layoutClass PageTitle ] [ text "Grupos de Carona" ]
                    ]
                , div [ className ListContainer ]
                    [ ul [ className List ] (List.map groupItem groups)
                    ]
                ]

        Error err ->
            text err


groupItem : Group -> Html Root.Msg
groupItem group =
    li [ id group.id, onClick (MsgForUrlRouter <| Go <| RidesListPage group.id) ] [ text group.name ]
