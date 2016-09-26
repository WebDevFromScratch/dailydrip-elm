module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Events exposing (onClick)

type alias Model =
    { counter: Int
    , incrementClicked: Int
    , decrementClicked: Int
    }

type Msg = Increment | Decrement

model : Model
model =
    Model 0 0 0

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { counter = model.counter + 1
            , incrementClicked = model.incrementClicked + 1
            , decrementClicked = model.decrementClicked }
        Decrement ->
            { counter = model.counter - 1
            , incrementClicked = model.incrementClicked
            , decrementClicked = model.decrementClicked + 1 }

view : Model -> Html Msg
view model =
    div []
    [ button [ onClick Decrement ] [ text "-" ]
    , text (toString model.counter)
    , button [ onClick Increment ] [ text "+" ]
    , h3 [] [ text (toString model.incrementClicked) ]
    , h3 [] [ text (toString model.decrementClicked) ] ]

main =
    App.beginnerProgram
        { model = model
        , view = view
        , update = update }
