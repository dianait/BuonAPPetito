import Foundation

class Order {
    let id: Int
    var totalAmount: Double = 0.0
    var isOffer: Bool = false
    var diss: Double = 25
    var pizzas: [Pizza] = Mock.pizzas
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

        if let index =  getIndex(pizza: pizza) {
            pizzas[index].account += 1
            print("ADD AN UNIT")
            print("🍕 \(pizzas)")
            print("🍕 \(pizzas.count)")
        }
        else {
            pizzas.append(pizza)
            print("ADD TO THE LIST")
            print("🍕 \(pizzas)")
            print("🍕 \(pizzas.count)")
        }
    }

    func removePizza(pizza: Pizza) {

        if let index =  getIndex(pizza: pizza) {
            if (pizzas[index].account < 2) {
                pizzas.remove(at: index)
                print("REMOVE FROM THE LIST")
                print("🍕 \(pizzas)")
                print("🍕 \(pizzas.count)")

            }
            else {
                pizzas[index].account -= 1
                print("REMOVE AN UNIT")
                print("🍕 \(pizzas)")
                print("🍕 \(pizzas.count)")
            }
        }
        else {
            print("🚨 ERROR: The pizza is not in the user list")
        }

    }

    func addIngredient(ing: Ingredient, pizza: Pizza) {
        if let index = getIndex(pizza: pizza) {
            if (!pizza.ingredients.contains(ing)) {
                pizzas[index].ingredients.append(ing)
            }
            else {
                print("the ingredient is already in the pizza")
            }
        }
        else {
            print("🚨 ERROR: The pizza is not in the user list")
        }

    }

    private func getIndex(pizza: Pizza) -> Int? {
        if let index = pizzas.firstIndex(of: pizza) {
            return index
        }
        return nil
    }
}
