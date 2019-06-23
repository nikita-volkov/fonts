module Fonts.Fonts exposing (..)

import Fonts.FontFace as FontFace exposing (FontFace)

type alias Fonts =
  {
    googleFonts : List String,
    fontFaces : List FontFace
  }

empty : Fonts
empty = { googleFonts = [], fontFaces = [] }

prepend : Fonts -> Fonts -> Fonts
prepend l r =
  {
    googleFonts = l.googleFonts ++ r.googleFonts,
    fontFaces = l.fontFaces ++ r.fontFaces
  }

concat : List Fonts -> Fonts
concat list =
  {
    googleFonts = List.concatMap .googleFonts list,
    fontFaces = List.concatMap .fontFaces list
  }

{-| Import a google font by family name. -}
googleFont : String -> Fonts
googleFont family =
  {
    googleFonts = List.singleton family,
    fontFaces = []
  }

{-| Define a font, specifying a family name, its weight and its location. -}
fontFace : String -> Int -> String -> Fonts
fontFace family weight uri =
  {
    googleFonts = [],
    fontFaces = List.singleton { family = family, weight = weight, uri = uri }
  }
