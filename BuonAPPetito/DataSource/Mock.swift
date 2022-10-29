import Foundation

struct Mock {

    static var ingredients: [Ingredient] = [
        Ingredient(name: "Onion"),
        Ingredient(name: "Tomato"),
        Ingredient(name: "Cheese"),
        Ingredient(name: "Bacon"),
        Ingredient(name: "Pinneaple"),
        Ingredient(name: "ham")
    ]

    static var pizzas: [Pizza] = [
        Pizza(id: 1, name: "Margarita"),
        Pizza(id: 1, name: "Carbonara"),
        Pizza(id: 1, name: "Diabolo"),
        Pizza(id: 1, name: "Calabresa"),
        Pizza(id: 1, name: "Etna")
    ]

    static var order: Order {
        Order(id: 1)
    }
}
