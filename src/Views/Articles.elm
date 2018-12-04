module Views.Articles exposing (view)

import Data.Article exposing (Article)
import Data.Network exposing (RemoteData(..))
import Html exposing (..)
import Html.Attributes exposing (href)
import Msg exposing (Msg(..))


view : RemoteData (List Article) -> Html.Html Msg
view remoteData =
    case remoteData of
        NotAsked ->
            text "NotAsked"

        Loading ->
            h3 [] [ text "Loading..." ]

        Loaded articles ->
            div [] [ viewArticles articles ]

        Failure ->
            h3 [] [ text "Error !!!" ]


viewArticles : List Article -> Html Msg
viewArticles articles =
    ul [] <|
        List.map viewLink articles


viewLink : Article -> Html msg
viewLink article =
    li [] [ a [ href ("/article/" ++ String.fromInt article.id) ] [ text ("see article " ++ String.fromInt article.id) ] ]
