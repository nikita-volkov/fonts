module Fonts.Stylesheet exposing (fonts)

import Set exposing (Set)
import Fonts.Types exposing (..)
import Fonts.Uris as Uris


importUri : String -> String
importUri uri = "@import url('" ++ uri ++ "');\n"

{-|
    @font-face {
      font-family: Effra;
      font-weight: 300;
      src: url("/fonts/Effra_Std_Lt.ttf") format("truetype");
    }
-}
fontFace : FontFace -> String
fontFace definition =
  "@font-face {\n" ++
  "  font-family: " ++ definition.family ++ ";\n" ++
  "  font-weight: " ++ String.fromInt definition.weight ++ ";\n" ++
  (if definition.italic then "  font-style: italic;\n" else "") ++
  "  src: url(\"" ++ definition.uri ++ "\");\n" ++
  "}\n"

googleFonts : List GoogleFont -> String
googleFonts list = if List.isEmpty list
  then ""
  else importUri <| Uris.googleFonts list

fontFaces : List FontFace -> String
fontFaces = List.map fontFace >> Set.fromList >> Set.foldl (++) ""

stylesheets : List String -> String
stylesheets = List.map importUri >> String.concat

{-|
Render font definitions into a CSS stylesheet.

Produces strings like the following:

    @import url('https://fonts.googleapis.com/css?family=B612+Mono|Roboto');
    @font-face {
      font-family: Effra;
      font-weight: 300;
      src: url("/fonts/Effra_Std_Lt.ttf");
    }

-}
fonts : List Font -> String
fonts =
  let
    googleFontsValue =
      List.filterMap <| \ font ->
        case font of
          GoogleFontFont googleFontValue -> Just googleFontValue
          _ -> Nothing
    fontFacesValue =
      List.filterMap <| \ font ->
        case font of
          FontFaceFont fontFaceValue -> Just fontFaceValue
          _ -> Nothing
    in \ fontsValue ->
      googleFonts (googleFontsValue fontsValue) ++
      fontFaces (fontFacesValue fontsValue)
