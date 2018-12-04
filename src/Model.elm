module Model exposing (Model)

import Browser.Navigation as Nav
import Data.Article exposing (Article)
import Msg exposing (Msg(..))
import Network exposing (RemoteData(..))
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
