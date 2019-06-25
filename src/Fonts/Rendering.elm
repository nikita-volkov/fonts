module Fonts.Rendering exposing (..)

import Set exposing (Set)
import Fonts.Fonts as Fonts exposing (Fonts)
import Fonts.FontFace as FontFace exposing (FontFace)
import Fonts.GoogleFont as GoogleFont exposing (GoogleFont)
import Fonts.Uris as Uris


type alias Rendering = String

importUri : String -> Rendering
importUri uri = "@import url('" ++ uri ++ "');\n"

{-|
    @font-face {
      font-family: Effra;
      font-weight: 300;
      src: url("/fonts/Effra_Std_Lt.ttf") format("truetype");
    }
-}
fontFace : FontFace -> Rendering
fontFace definition =
  "@font-face {\n" ++
  "  font-family: " ++ definition.family ++ ";\n" ++
  "  font-weight: " ++ String.fromInt definition.weight ++ ";\n" ++
  "  src: url(\"" ++ definition.uri ++ "\");\n" ++
  "}\n"

googleFonts : List GoogleFont -> Rendering
googleFonts list = if List.isEmpty list
  then ""
  else importUri <| Uris.googleFonts list

fontFaces : List FontFace -> Rendering
fontFaces = List.map fontFace >> Set.fromList >> Set.foldl (++) ""

stylesheets : List String -> Rendering
stylesheets = List.map importUri >> String.concat

rules : Fonts -> Rendering
rules definition =
  googleFonts definition.googleFonts ++
  stylesheets definition.stylesheets ++
  fontFaces definition.fontFaces
