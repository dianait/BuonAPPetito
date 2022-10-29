import Foundation

struct Order {
    let id: Int
    var totalAmount: Double = 0.0
    var isOffer: Bool = false
    var pizza: [Pizza] = []
    let date: Date
}
