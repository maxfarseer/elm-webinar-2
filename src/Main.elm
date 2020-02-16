module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, li, text, ul)
import Http
import Json.Decode as JD exposing (Decoder, at, field, list, string)


type alias Fruit =
    { name : String
    , emoji : String
    }


type FruitsRequest
    = Loading
    | Failure
    | Success (List Fruit)


type alias Model =
    { fruits : FruitsRequest }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { fruits = Loading }
    , Http.get
        { url = "http://my-json-server.typicode.com/maxfarseer/elm-webinar-2/fruits"
        , expect = Http.expectJson GotFruits fruitsDecoder
        }
    )


type Msg
    = GotFruits (Result Http.Error (List Fruit))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotFruits response ->
            case response of
                Ok fruits ->
                    ( { model | fruits = Success fruits }, Cmd.none )

                Err _ ->
                    ( { model | fruits = Failure }, Cmd.none )



-- Decoders


fruitsDecoder : Decoder (List Fruit)
fruitsDecoder =
    list decodeFruit


decodeFruit : Decoder Fruit
decodeFruit =
    JD.map2 Fruit
        (field "name" string)
        (field "emoji" string)


renderItem : Fruit -> Html Msg
renderItem fruit =
    li [] [ text (fruit.emoji ++ " " ++ fruit.name) ]


renderFruits : List Fruit -> Html Msg
renderFruits data =
    let
        list =
            List.map renderItem data
    in
    ul [] list


view : Model -> Html Msg
view model =
    case model.fruits of
        Success fruits ->
            div []
                [ h1 []
                    [ text "Сезон фруктов!" ]
                , renderFruits fruits
                ]

        Loading ->
            div []
                [ text "Загружаю" ]

        Failure ->
            div []
                [ text "Во время загрузки, произошла ошибка" ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
