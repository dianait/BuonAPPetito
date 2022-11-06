import Foundation

struct Mock {

    static var ingredients: [Ingredient] = [
        Ingredient(id: 1, name: "🧅 Onion"),
        Ingredient(id: 2, name: "🍅 Tomato"),
        Ingredient(id: 3, name: "🧀 Cheese"),
        Ingredient(id: 4, name: "🥓 Bacon"),
        Ingredient(id: 5, name: "🍍 Pinneaple"),
        Ingredient(id: 6, name: "🌶 Chili")
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
