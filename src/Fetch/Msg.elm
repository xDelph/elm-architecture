module Fetch.Msg exposing (Msg(..))

import Data.Article exposing (Article)
import Http


type Msg
    = OnFetchArticle (Result Http.Error Article)
    | OnFetchArticles (Result Http.Error (List Article))
