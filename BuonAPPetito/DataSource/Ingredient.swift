import Foundation

struct Ingredient: Hashable, Identifiable {
    let id: Int
    let name: String
    let emoji: String
    var isAdded: Bool = false
}


