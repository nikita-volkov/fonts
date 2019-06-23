module Fonts.Rendering exposing (..)

import Set exposing (Set)
import Fonts.Rules as Rules exposing (Rules)
import Fonts.FontFace as FontFace exposing (FontFace)
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

googleFonts : List String -> Rendering
googleFonts families = if List.isEmpty families
  then ""
  else importUri <| Uris.googleFonts (Set.fromList families)

fontFaces : List FontFace -> Rendering
fontFaces = List.map fontFace >> Set.fromList >> Set.foldl (++) ""

rules : Rules -> Rendering
rules definition =
  googleFonts definition.googleFonts ++
  fontFaces definition.fontFaces
