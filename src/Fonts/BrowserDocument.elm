module Fonts.BrowserDocument exposing (..)

import Browser exposing (Document)
import Html exposing (Html)
import Fonts.Font as Font exposing (Font)
import Fonts.Extensions.Html as Html


{-| The record that you pass to `Browser.document`. -}
type alias BrowserDocument flags msg model =
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
withFonts : List Font -> BrowserDocument flags msg model -> BrowserDocument flags msg model
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
