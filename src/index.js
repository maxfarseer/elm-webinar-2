import { Elm } from './Main.elm'

const fruits = [
  { "name": "Яблоко", "emoji": "🍏" },
  { "name": "Груша", "emoji": "🍐" },
  { "name": "Банан", "emoji": "🍌" },
  { "name": "Апельсин", "emoji": "🍊" },
  { "name": "Лимон", "emoji": "🍋" }
]

Elm.Main.init({
  flags: fruits,
  node: document.querySelector('main')
})