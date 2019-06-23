module Fonts.Html exposing (..)

import Html exposing (..)
import Html.Attributes as Attributes
import Fonts.Rules as Rules exposing (Rules)
import Fonts.Rendering as Rendering exposing (Rendering)

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
style : Rules -> Html msg
style definition =
  node "style"
    [
      Attributes.type_ "text/css"
    ]
    [
      text (Rendering.rules definition)
    ]
