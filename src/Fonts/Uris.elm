module Fonts.Uris exposing (..)

import Set exposing (Set)
import Url
import Fonts.Types exposing (..)


googleFonts : List GoogleFont -> String
googleFonts =
  let
    id x =
      Url.percentEncode x.family ++ ":" ++ String.fromInt x.weight ++
      (if x.italic then "i" else "")
    in
      List.map id >>
      Set.fromList >>
      Set.toList >>
      List.intersperse "|" >>
      (::) "https://fonts.googleapis.com/css?display=block&family=" >>
      String.concat
