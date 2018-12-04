module Fetch.Article exposing (fetchArticle, fetchArticles)

import Data.Article exposing (Article)
import Fetch.Msg exposing (Msg(..))
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (required)


fetchArticleUrl : String -> String
fetchArticleUrl articleId =
    "http://localhost:3000/articles/" ++ articleId


fetchArticlesUrl : String
fetchArticlesUrl =
    "http://localhost:3000/articles"


fetchArticle : String -> Cmd Msg
fetchArticle articleId =
    Http.get (fetchArticleUrl articleId) articleDecoder
        |> Http.send OnFetchArticle


fetchArticles : Cmd Msg
fetchArticles =
    Http.get fetchArticlesUrl articlesDecoder
        |> Http.send OnFetchArticles


articleDecoder : Decode.Decoder Article
articleDecoder =
    Decode.succeed Article
        |> required "id" Decode.int
        |> required "author" Decode.string
        |> required "content" Decode.string


articlesDecoder : Decode.Decoder (List Article)
articlesDecoder =
    Decode.list articleDecoder
