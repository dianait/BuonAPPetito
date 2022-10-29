import Foundation

class Order {
    let id: Int
    var totalAmount: Double = 0.0
    var isOffer: Bool = false
    var diss: Double = 25
    var pizzas: [Pizza] = []
    let date: Date = Date.now

    init(id: Int) {
        self.id = id
    }

    func getAmount() {

        for pizza in pizzas {
            let currentPizzaAmount = Double(pizza.account) * pizza.price
            self.totalAmount = self.totalAmount + currentPizzaAmount
        }

        if (isOffer) {
            let percentageToPay: Double = Double(100 - (self.diss / 100))
            self.totalAmount = totalAmount * percentageToPay
        }
    }

    func addPizza(pizza: Pizza) {

        if let index = pizzas.firstIndex(of: pizza) {
            pizzas[index].account = pizzas[index].account + 1
        }
        else {
            pizzas.append(pizza)
        }

    }

    func removePizza(pizza: Pizza) {

        if let index = pizzas.firstIndex(of: pizza) {
            if (pizzas[index].account < 2) {
                pizzas.remove(at: index)
            }
            else {
                pizzas[index].account = pizzas[index].account - 1
            }
        }
    }
}
