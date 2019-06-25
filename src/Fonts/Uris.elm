module Fonts.Uris exposing (..)

import Set exposing (Set)
import Url
import Fonts.GoogleFont as GoogleFont exposing (GoogleFont)


googleFonts : List GoogleFont -> String
googleFonts =
  let
    id x =
      x.family ++ ":" ++ String.fromInt x.weight ++
      (if x.italic then "i" else "")
    in
      List.map (id >> Url.percentEncode) >>
      Set.fromList >>
      Set.toList >>
      List.intersperse "|" >>
      (::) "https://fonts.googleapis.com/css?family=" >>
      String.concat
