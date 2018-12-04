module View exposing (view)

import Browser
import Html exposing (Html, a, b, div, h1, img, li, section, text, ul)
import Html.Attributes exposing (class, href, src)
import Model exposing (Model)
import Msg exposing (..)
import Routes exposing (..)
import Url
import Views.Article as ArticleView exposing (view)
import Views.Articles as ArticlesView exposing (view)


page : Model -> Html Msg
page model =
    let
        content =
            pageWithData model
    in
    section []
        [ div [ class "p-4" ] [ content ]
        ]


pageWithData : Model -> Html Msg
pageWithData model =
    case model.route of
        ArticleRoute id ->
            ArticleView.view model.article

        ArticlesRoute ->
            ArticlesView.view model.articles

        NotFoundRoute ->
            notFoundView


view : Model -> Browser.Document Msg
view model =
    { title = "URL Interceptor"
    , body =
        -- [ text "The current URL is: "
        -- , b [] [ text (Url.toString model.url) ]
        [ b [] [ text ("The current URL is: " ++ Url.toString model.url) ]
        , page model
        ]
    }


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
