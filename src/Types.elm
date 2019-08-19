module Types exposing (..)
import Http

    
type alias Model =
    { gifField : String
    , status : HttpStatus 
    }

type HttpStatus
    = Failure
    | Loading 
    | Success String


type Msg
  = MorePlease
  | GotGif (Result Http.Error String)
  | GetGif String