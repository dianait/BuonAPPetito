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
        Pizza(id: 1, name: "Margarita")
    ]

    static var order: Order {
        Order(id:1, date: Date.now)
    }
}
