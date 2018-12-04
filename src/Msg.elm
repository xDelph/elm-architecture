module Msg exposing (Msg(..))

import Browser
import Fetch.Msg as Fetch exposing (Msg(..))
import Url


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | NoOp
    | FetchMsg Fetch.Msg
