import Foundation

struct Pizza: Equatable, Identifiable, Hashable {
    static func == (lhs: Pizza, rhs: Pizza) -> Bool {
        lhs.name == rhs.name
    }

    let id: Int
    var name: String
    let price: Double = 9.90
    var ingredients: [Ingredient] = []
    var account: Int = 1
}



 
