import Foundation

struct Pizza {
    let id: Int
    let name: String
    let price: Double = 9.90
    var ingredients: [Ingredient] = Mock.ingredients
    var count: Int = 0
}



