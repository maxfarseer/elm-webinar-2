module Main exposing (main)

import Html exposing (Html, div, h1, li, text, ul)



-- переменные (аналог const XXX = ... )


fruits : List String
fruits =
    [ "яблоко", "банан", "груша" ]



-- функции для отрисовки


renderItem : String -> Html msg
renderItem fruitName =
    li [] [ text fruitName ]


renderFruits : List String -> Html msg
renderFruits data =
    let
        list =
            List.map renderItem data
    in
    ul [] list



-- главная view функция


main =
    div []
        [ h1 []
            [ text "Сезон фруктов!" ]
        , renderFruits fruits
        ]
