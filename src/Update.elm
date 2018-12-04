module Update exposing (init, update)

import Browser
import Browser.Navigation as Nav
import Fetch.Article exposing (fetchArticle, fetchArticles)
import Fetch.Update as Fetch exposing (update)
import Model exposing (Model)
import Msg exposing (..)
import Network exposing (RemoteData(..))
import Routes exposing (..)
import Url


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        model =
            { key = key
            , url = url
            , route = Routes.NotFoundRoute
            , article = NotAsked
            , articles = NotAsked
            , errorMessage = ""
            }
    in
    changeUrl model url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchMsg fetchMsg ->
            let
                ( newModel, cmd ) =
                    Fetch.update fetchMsg model
            in
            ( newModel, Cmd.map FetchMsg cmd )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            changeUrl model url

        _ ->
            ( model, Cmd.none )


changeUrl : Model -> Url.Url -> ( Model, Cmd Msg )
changeUrl model url =
    case Routes.parseUrl url of
        ArticleRoute articleId ->
            ( { model | url = url, route = ArticleRoute articleId, errorMessage = "", article = Loading }, Cmd.map FetchMsg (Cmd.batch [ fetchArticle articleId, Cmd.none ]) )

        ArticlesRoute ->
            ( { model | url = url, route = ArticlesRoute, errorMessage = "", articles = Loading }, Cmd.map FetchMsg (Cmd.batch [ fetchArticles, Cmd.none ]) )

        _ ->
            ( { model | url = url, route = Routes.parseUrl url, errorMessage = "" }, Cmd.none )
