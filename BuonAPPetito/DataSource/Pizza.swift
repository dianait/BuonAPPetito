import Foundation

struct Pizza: Equatable, Identifiable, Hashable {
    static func == (lhs: Pizza, rhs: Pizza) -> Bool {
        lhs.name == rhs.name
    }

    let id: Int
    var name: String
    let price: Double = 9.90
    var ingredients: [Ingredient] = [
        Ingredient(id: 1, name: "🧅 Onion", isAdded: true),
            Ingredient(id: 2, name: "🍅 Tomato", isAdded: true),
            Ingredient(id: 3, name: "🧀 Cheese", isAdded: true),
            Ingredient(id: 4, name: "🥓 Bacon", isAdded: true)]
    var account: Int = 1
}



 
