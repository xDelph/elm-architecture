module Main exposing (main)

import Browser
import Model exposing (Model)
import Msg exposing (Msg(..))
import Update exposing (..)
import View exposing (..)



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = Update.init
        , view = View.view
        , update = Update.update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
