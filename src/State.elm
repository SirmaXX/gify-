module State exposing (..)

import Types exposing (..)
import Rests exposing(..)

init : () -> (Model, Cmd Msg)
init _ =
      ({ gifField = "cat",status =Loading},getRandomCatGif "cat" )


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GetGif search ->
       ({ model| gifField =search  }, Cmd.none )

    MorePlease ->
      ( { model | gifField = "", status = Loading} , getRandomCatGif model.gifField )

    GotGif result ->
      case result of
        Ok url ->
            ( { model | status = Success url} , Cmd.none )

        Err _ ->
         ( { model | status = Failure} , Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

