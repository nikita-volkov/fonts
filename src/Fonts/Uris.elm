module Fonts.Uris exposing (..)

import Set exposing (Set)
import Url


googleFonts : Set String -> String
googleFonts =
  Set.toList >>
  List.map Url.percentEncode >>
  List.intersperse "|" >>
  (::) "https://fonts.googleapis.com/css?family=" >>
  String.concat
