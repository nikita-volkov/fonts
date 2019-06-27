module Fonts.Font exposing (Font, googleFont, fontFace)

import Fonts.Types exposing (..)


{-| Font specification. -}
type alias Font = Fonts.Types.Font

{-| Import a google font by specifying its family name, weight and whether its italic. -}
googleFont : String -> Int -> Bool -> Font
googleFont family weight italic =
  GoogleFontFont { family = family, weight = weight, italic = italic }

{-| Define a font, specifying a family name, its weight and its location. -}
fontFace : String -> Int -> Bool -> String -> Font
fontFace family weight italic uri =
  FontFaceFont { family = family, weight = weight, italic = italic, uri = uri }
