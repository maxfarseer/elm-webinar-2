module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, li, text, ul)


type alias Fruit =
    { name : String
    , emoji : String
    }


type alias Flags =
    {}


type alias Model =
    {}


fruits : List Fruit
fruits =
    [ { name = "Яблоко"
      , emoji = "🍏"
      }
    , { name = "Груша"
      , emoji = "🍐"
      }
    , Fruit "Банан" "🍌"
    ]


init : Flags -> ( Model, Cmd msg )
init flags =
    ( {}, Cmd.none )


update : msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )


renderItem : Fruit -> Html msg
renderItem fruit =
    li [] [ text (fruit.emoji ++ " " ++ fruit.name) ]


renderFruits : List Fruit -> Html msg
renderFruits data =
    let
        list =
            List.map renderItem data
    in
    ul [] list


view : Model -> Html msg
view model =
    div []
        [ h1 []
            [ text "Сезон фруктов!" ]
        , renderFruits fruits
        ]


main : Program Flags Model msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
