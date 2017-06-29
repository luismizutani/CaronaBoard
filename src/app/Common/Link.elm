module Common.Link exposing (linkTo)

import Model as RootMsg exposing (Msg(..))
import Testable.Html exposing (Attribute, Html, a)
import Testable.Html.Events exposing (onClick)
import UrlRouter.Model exposing (Msg(Go))
import UrlRouter.Routes exposing (Page, toPath)


linkTo : Page -> List (Attribute RootMsg.Msg) -> List (Html RootMsg.Msg) -> Html RootMsg.Msg
linkTo page attributes =
    a
        ([ onClick (MsgForUrlRouter <| Go page)
         ]
            ++ attributes
        )
