module Routes exposing (Route(..), matchers, parseUrl)

import Regex
import Url exposing (Url)
import Url.Parser exposing (..)


type Route
    = ArticleRoute String
    | ArticlesRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map ArticlesRoute top
        , map ArticlesRoute (s "articles")
        , map ArticleRoute (s "article" </> string)
        ]


parseUrl : Url -> Route
parseUrl url =
    case parse matchers url of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
