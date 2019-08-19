module Rests exposing (..)

import Json.Decode exposing (Decoder, field, float, map4,float,string,int)
import Http
import Types exposing (..)
-- HTTP


-- HTTP


getRandomCatGif :String -> Cmd Msg
getRandomCatGif gif =
  Http.get
    { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++gif
    , expect = Http.expectJson GotGif gifDecoder
    }


gifDecoder : Decoder String
gifDecoder =
  field "data" (field "image_url" string)


