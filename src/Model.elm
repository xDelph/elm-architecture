module Model exposing (Model)

import Browser.Navigation as Nav
import Data.Article exposing (Article)
import Data.Network exposing (RemoteData(..))
import Msg exposing (Msg(..))
import Routes exposing (..)
import Url


type alias Model =
    ----- APP -----
    { key : Nav.Key
    , url : Url.Url
    , route : Route

    ----- DATA -----
    , article : RemoteData Article
    , articles : RemoteData (List Article)

    ----- HTTP -----
    , errorMessage : String
    }
