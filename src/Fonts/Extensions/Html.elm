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
style : List Font -> Html msg
style fonts =
  node "style"
    [
      Attributes.type_ "text/css"
    ]
    [
      text (Stylesheet.fonts fonts)
    ]

{-| 
Same as `style`, but also subscribes to the "onload" event.

Unfortunately, some browsers do not support it.
-}
styleWithOnLoad : msg -> List Font -> Html msg
styleWithOnLoad onLoadMsg fonts =
  node "style"
    [
      Attributes.type_ "text/css",
      Events.on "load" (Json.Decode.map (always onLoadMsg) Json.Decode.value)
    ]
    [
      text (Stylesheet.fonts fonts)
    ]
