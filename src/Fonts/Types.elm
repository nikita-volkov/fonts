module Fonts.Types exposing (..)


type Font =
  GoogleFontFont GoogleFont |
  FontFaceFont FontFace

{-|
Definition of a Google font
-}
type alias GoogleFont =
  {
    family : String,
    weight : Int,
    italic : Bool
  }

{-|
Definition of CSS font-face.

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
    italic : Bool,
    uri : String
  }
