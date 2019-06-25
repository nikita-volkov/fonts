module Fonts.Extensions.Program exposing (..)

import Browser exposing (..)
import Fonts.Fonts as Fonts exposing (Fonts)
import Fonts.Extensions.Html as Html


documentWithFonts :
  {
    init : flags -> ( model, Cmd msg ),
    view : model -> Document msg,
    fonts : Fonts,
    update : msg -> model -> ( model, Cmd msg ),
    subscriptions : model -> Sub msg
  } ->
  Program flags model msg
documentWithFonts spec =
  let
    view model =
      let
        document = spec.view model
        title = document.title
        body = Html.style spec.fonts :: document.body
        in { title = title, body = body }
    in
      document
        {
          init = spec.init,
          view = view,
          update = spec.update,
          subscriptions = spec.subscriptions
        }
