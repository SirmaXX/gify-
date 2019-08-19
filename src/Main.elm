module Main exposing (..)

import Browser
import Html exposing (Html)
import Element exposing (..)
import Element.Font as Font
import Element.Input as Input
import Element.Background as Background
import Element.Border as Border
import Colors exposing(..)
import Types exposing(..)
import State exposing(..)
import Rests exposing(..)
import View exposing(..)

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }
