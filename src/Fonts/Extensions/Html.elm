module Fonts.Extensions.Html exposing (..)

import Html exposing (..)
import Html.Attributes as Attributes
import Fonts.Types exposing (..)
import Fonts.Stylesheet as Stylesheet

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
style : List Font -> Html msg
style fonts =
  node "style"
    [
      Attributes.type_ "text/css"
    ]
    [
      text (Stylesheet.fonts fonts)
    ]
