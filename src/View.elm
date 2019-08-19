module View exposing (..)
import Browser
import Html exposing (Html)
import Element exposing (..)
import Element.Font as Font
import Element.Input as Input
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Types exposing (..)
import Rests exposing(..)
import Colors exposing(..)


view : Model -> Html Msg
view model = 
 Element.layout[Element.width Element.fill ,Element.height Element.fill,centerX,centerY ]  <|
    viewBox model


                
viewBox : Model->  Element Msg
viewBox model =
  case model.status of
    Failure ->
            Element.column [ ]
            [ el
                [ 
                 centerX
                , Font.size 36
                ]
                (text "Post Finder")
            ,  Input.search
                [ spacing 1
                ,centerX,centerY
                ]
                {text = model.gifField
               , placeholder = Just (Input.placeholder [] (text ""))
               , onChange = GetGif
               , label = Input.labelAbove [ Font.size 14   ] (text "postid")
                }
            
            , Input.button
                [ Background.color blue
                , Font.color white
                , Border.color darkBlue
                , paddingXY 16 16
                , Border.rounded 4
                
                ,spacing 100
                ]
                {  
                 onPress =Just MorePlease
                , label = el [centerX,centerY] <| Element.text "GetPost"
                }
            ]



    Loading ->
      Element.text "Loading..."




    Success url ->
        Element.column [ ]
            [ el
                [ 
                 centerX
                , Font.size 36
                ]
                (text "Gify gif finder")
            ,  Input.username
                [ spacing 1
                ,centerX,centerY
                ]
                {text = model.gifField
               , placeholder = Just (Input.placeholder [] (text ""))
               , onChange = GetGif
               , label = Input.labelAbove [ Font.size 14   ] (text "gifname")
                }
            
            , Input.button
                [ Background.color blue
                , Font.color white
                , Border.color darkBlue
                , paddingXY 16 16
                , Border.rounded 4
                
                ,spacing 100
                ]
                { onPress =Just MorePlease
                , label = el [centerX,centerY] <| Element.text "GetPost"
                }
                
            ,Element.image[]{
              src = url
            , description = "image"
            }
            
            ]