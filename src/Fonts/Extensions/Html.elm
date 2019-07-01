module Fonts.Extensions.Html exposing (..)

import Html exposing (..)
import Html.Attributes as Attributes
import Html.Events as Events
import Fonts.Types exposing (..)
import Fonts.Stylesheet as Stylesheet
import Json.Decode

{-| Generate a stylesheet in HTML.

E.g., a tag like this:

    <style>
    @import url('https://fonts.googleapis.com/css?family=B612+Mono|Roboto');
    @font-face {
      font-family: Effra;
      font-weight: 300;
      src: url("/fonts/Effra_Std_Lt.ttf");
    }
    </style>

-}
style : msg -> List Font -> Html msg
style onLoadMsg fonts =
  node "style"
    [
      Attributes.type_ "text/css",
      Events.on "load" (Json.Decode.map (always onLoadMsg) Json.Decode.value)
    ]
    [
      text (Stylesheet.fonts fonts)
    ]
