module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, li, text, ul)
import Http


type alias Fruit =
    { name : String
    , emoji : String
    }


type FruitsRequest
    = Loading
    | Failure
    | Success


type alias Model =
    { fruits : FruitsRequest }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { fruits = Loading }
    , Http.get
        { url = "http://my-json-server.typicode.com/maxfarseer/elm-webinar-2/fruits"
        , expect = Http.expectString GotFruits
        }
    )


type Msg
    = GotFruits (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotFruits response ->
            case response of
                Ok fruits ->
                    ( { model | fruits = Success }, Cmd.none )

                Err _ ->
                    ( { model | fruits = Failure }, Cmd.none )


renderItem : Fruit -> Html msg
renderItem fruit =
    li [] [ text (fruit.emoji ++ " " ++ fruit.name) ]


renderFruits : List Fruit -> Html Msg
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

        --, renderFruits model.fruits
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
