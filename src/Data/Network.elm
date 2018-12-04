module Data.Network exposing (RemoteData(..))

import Html exposing (..)
import Http


type Error
    = BadUrl String
    | Timeout
    | NetworkError
    | BadStatus (Result Http.Error String)
    | BadPayload String (Result Http.Error String)


type RemoteData a
    = NotAsked
    | Loading
    | Loaded a
    | Failure
