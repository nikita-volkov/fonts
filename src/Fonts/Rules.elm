module Fonts.Rules exposing (..)

import Fonts.FontFace as FontFace exposing (FontFace)

type alias Rules =
  {
    googleFonts : List String,
    fontFaces : List FontFace
  }

empty : Rules
empty = { googleFonts = [], fontFaces = [] }

prepend : Rules -> Rules -> Rules
prepend l r =
  {
    googleFonts = l.googleFonts ++ r.googleFonts,
    fontFaces = l.fontFaces ++ r.fontFaces
  }

concat : List Rules -> Rules
concat list =
  {
    googleFonts = List.concatMap .googleFonts list,
    fontFaces = List.concatMap .fontFaces list
  }

{-| Import a google font by family name. -}
googleFont : String -> Rules
googleFont family =
  {
    googleFonts = List.singleton family,
    fontFaces = []
  }

{-| Define a font, specifying a family name, its weight and its location. -}
fontFace : String -> Int -> String -> Rules
fontFace family weight uri =
  {
    googleFonts = [],
    fontFaces = List.singleton { family = family, weight = weight, uri = uri }
  }
