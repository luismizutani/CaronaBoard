module Layout.View.SplashScreen exposing (splashScreen)

import Testable.Html exposing (Html, div)
import Testable.Html.Attributes exposing (style)
import Msg exposing (Msg(..))
import Css exposing (..)
import Common.Colors exposing (..)


splashScreen : Html Msg
splashScreen =
    div [ style splashScreenStyle ] []


splashScreenStyle : List ( String, String )
splashScreenStyle =
    asPairs
        [ width (pct 100)
        , height (pct 100)
        , top (px 0)
        , left (px 0)
        , position fixed
        , backgroundImage (url "images/logo.svg")
        , backgroundColor primaryBlue
        , backgroundRepeat noRepeat
        , backgroundPosition center
        , backgroundSize2 (px 192) (px 192)
        ]
