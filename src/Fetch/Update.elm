module Fetch.Update exposing (update)

import Fetch.Msg exposing (Msg(..))
import Http
import Model exposing (Model)
import Network exposing (RemoteData(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnFetchArticle (Ok article) ->
            ( { model | article = Loaded article }, Cmd.none )

        OnFetchArticle (Err err) ->
            ( { model | article = Failure, errorMessage = createErrorMessage err }, Cmd.none )

        OnFetchArticles (Ok articles) ->
            ( { model | articles = Loaded articles }, Cmd.none )

        OnFetchArticles (Err err) ->
            ( { model | articles = Failure, errorMessage = createErrorMessage err }, Cmd.none )


createErrorMessage : Http.Error -> String
createErrorMessage httpError =
    case httpError of
        Http.BadUrl message ->
            message

        Http.Timeout ->
            "Server is taking too long to respond. Please try again later."

        Http.NetworkError ->
            "It appears you don't have an Internet connection right now."

        Http.BadStatus response ->
            response.status.message

        Http.BadPayload message response ->
            message
