import Foundation

struct Pizza: Equatable, Identifiable, Hashable {
    static func == (lhs: Pizza, rhs: Pizza) -> Bool {
        lhs.name == rhs.name
    }

    let id: Int
    var name: String
    let price: Double = 9.90
    var ingredients: [Ingredient] = [
        Ingredient(id: 1, name: "🧅 Onion", emoji: "🧅", isAdded: true),
        Ingredient(id: 2, name: "🍅 Tomato", emoji: "🍅", isAdded: true),
        Ingredient(id: 3, name: "🧀 Cheese", emoji: "🧀",  isAdded: true),
        Ingredient(id: 4, name: "🥓 Bacon", emoji: "🥓", isAdded: true),
        Ingredient(id: 5, name: "🍍 Pinneaple", emoji: "🍍")]
    var account: Int = 1
}



 
