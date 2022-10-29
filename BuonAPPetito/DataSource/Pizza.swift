import Foundation

struct Pizza: Equatable {
    static func == (lhs: Pizza, rhs: Pizza) -> Bool {
        lhs.name == rhs.name
    }

    let id: Int
    let name: String
    let price: Double = 9.90
    var ingredients: [Ingredient] = Mock.ingredients
    var account: Int = 1
}



 
