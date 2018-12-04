module Views.Article exposing (view)

import Data.Article exposing (Article)
import Data.Network exposing (RemoteData(..))
import Html exposing (..)
import Html.Attributes exposing (href)
import Msg exposing (Msg(..))


view : RemoteData Article -> Html.Html Msg
view remoteData =
    case remoteData of
        NotAsked ->
            text "NotAsked"

        Loading ->
            h3 [] [ text "Loading..." ]

        Loaded article ->
            div [] [ viewArticle article ]

        Failure ->
            h3 [] [ text "Error !!!" ]


viewArticle : Article -> Html Msg
viewArticle article =
    div []
        [ div [] [ text ("id : " ++ String.fromInt article.id) ]
        , div [] [ text ("author : " ++ article.author) ]
        , div [] [ text ("content : " ++ article.content) ]
        ]
