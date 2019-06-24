module Fonts.Fonts exposing (..)

import Fonts.FontFace as FontFace exposing (FontFace)

type alias Fonts =
  {
    googleFonts : List String,
    fontFaces : List FontFace,
    stylesheets : List String
  }

empty : Fonts
empty = { googleFonts = [], fontFaces = [], stylesheets = [] }

prepend : Fonts -> Fonts -> Fonts
prepend l r =
  {
    googleFonts = l.googleFonts ++ r.googleFonts,
    fontFaces = l.fontFaces ++ r.fontFaces,
    stylesheets = l.stylesheets ++ r.stylesheets
  }

concat : List Fonts -> Fonts
concat list =
  {
    googleFonts = List.concatMap .googleFonts list,
    fontFaces = List.concatMap .fontFaces list,
    stylesheets = List.concatMap .stylesheets list
  }

{-| Import a google font by family name. -}
googleFont : String -> Fonts
googleFont family =
  {
    googleFonts = List.singleton family,
    fontFaces = [],
    stylesheets = []
  }

{-| Define a font, specifying a family name, its weight and its location. -}
fontFace : String -> Int -> String -> Fonts
fontFace family weight uri =
  {
    googleFonts = [],
    fontFaces = List.singleton { family = family, weight = weight, uri = uri },
    stylesheets = []
  }

{-| Import a font-stylesheet by its location. -}
stylesheet : String -> Fonts
stylesheet uri =
  {
    googleFonts = [],
    fontFaces = [],
    stylesheets = List.singleton uri
  }
