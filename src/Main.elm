module Main exposing (main)

import Html exposing (Html, div, h1, li, text, ul)



-- 🍏 🍐 🍌


type alias Fruit =
    { name : String
    , emoji : String
    }



{-
   обратите внимание как указан "банан"
   Это просто еще один вариант создания "объекта".
   Можно сказать, что type alias Fruit в какой-то мере
   функция конструктор и придумать такой пример:
   const banan = new Fruit('банан','смайлик')
   Аргументы должны идти в таком же порядке,
   в каком они перечислены в type alias
-}


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



-- функции для отрисовки


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



-- главная view функция


main =
    div []
        [ h1 []
            [ text "Сезон фруктов!" ]
        , renderFruits fruits
        ]
