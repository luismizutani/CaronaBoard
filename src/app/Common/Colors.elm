module Common.Colors exposing (darkTextColor, lightTextColor, primaryBlue, lighterBlue, primaryBlack, white, grey)

import Css exposing (Color, rgb)


darkTextColor : Color
darkTextColor =
    primaryBlack


lightTextColor : Color
lightTextColor =
    white


primaryBlue : Color
primaryBlue =
    rgb 52 103 255


lighterBlue : Color
lighterBlue =
    rgb 80 130 255


primaryBlack : Color
primaryBlack =
    rgb 85 85 85


white : Color
white =
    rgb 255 255 255


grey : Color
grey =
    rgb 240 240 240
