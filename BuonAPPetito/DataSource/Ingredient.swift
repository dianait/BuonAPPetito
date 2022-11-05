import Foundation

struct Ingredient: Hashable, Identifiable {
    let id: Int
    let name: String
    var isAdded: Bool = false
}


