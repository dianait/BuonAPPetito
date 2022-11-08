import Foundation

struct Mock {

    static var ingredients: [Ingredient] = [
        Ingredient(id: 1, name: "🧅 Onion", emoji: "🧅"),
        Ingredient(id: 2, name: "🍅 Tomato", emoji: "🍅"),
        Ingredient(id: 3, name: "🧀 Cheese", emoji: "🧀"),
        Ingredient(id: 4, name: "🥓 Bacon", emoji: "🥓"),
        Ingredient(id: 5, name: "🍍 Pinneaple", emoji: "🍍"),
        Ingredient(id: 6, name: "🌶 Chili", emoji: "🌶")
    ]

    static var pizzas: [Pizza] = [
        Pizza(id: 1, name: "Margarita"),
        Pizza(id: 2, name: "Carbonara"),
        Pizza(id: 3, name: "Diabolo"),
        Pizza(id: 4, name: "Calabresa"),
        Pizza(id: 5, name: "Etna")
    ]

    static var order: Order {
        Order(id: 1)
    }
}
