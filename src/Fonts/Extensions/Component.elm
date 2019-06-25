module Fonts.Extensions.Component exposing (..)

import Browser exposing (Document)
import Html exposing (Html)
import Fonts.Fonts as Fonts exposing (Fonts)
import Fonts.Html as Html


{-| The record that you pass to `Browser.document`. -}
type alias Component flags msg model =
  {
    init : flags -> ( model, Cmd msg ),
    view : model -> Document msg,
    update : msg -> model -> ( model, Cmd msg ),
    subscriptions : model -> Sub msg
  }

{-|
Extend an existing component specification
with a functionality of preloading fonts.
-}
withFonts : Fonts -> Component flags msg model -> Component flags msg model
withFonts fonts component =
  let
    view model =
      let
        document = component.view model
        title = document.title
        body = Html.style fonts :: document.body
        in { title = title, body = body }
    in
      {
        init = component.init,
        view = view,
        update = component.update,
        subscriptions = component.subscriptions
      }
