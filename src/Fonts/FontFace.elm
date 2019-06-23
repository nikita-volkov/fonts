module Fonts.FontFace exposing (..)
{-| DSL for defining font-face. -}

{-| Definition of CSS font-face.

    @font-face {
      font-family: Effra;
      font-weight: 300;
      src: url("/fonts/Effra_Std_Lt.ttf") format("truetype");
    }
-}
type alias FontFace =
  {
    family : String,
    weight : Int,
    uri : String
  }
