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

        if let index =  getIndexPizza(pizza: pizza) {
            pizzas[index].account += 1
        }
        else {
            pizzas.append(pizza)
        }
    }

    func removePizza(pizza: Pizza) {

        if let index =  getIndexPizza(pizza: pizza) {
            if (pizzas[index].account < 2) {
                pizzas.remove(at: index)

            }
            else {
                pizzas[index].account -= 1
            }
        }
        else {
            print("🚨 ERROR: The pizza is not in the user list")
        }

    }

    func addIngredient(ing: Ingredient, pizza: Pizza) {
        if let index = getIndexPizza(pizza: pizza) {
            if (!pizzas[index].ingredients.contains(ing)) {
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

    func removeIngredient(ing: Ingredient, pizza: Pizza) {
        if let index = getIndexPizza(pizza: pizza) {
            if (pizzas[index].ingredients.contains(ing)) {
                if let indexIng = getIndexIngredient(pizza: pizzas[index], ing: ing) {
                    pizzas[index].ingredients.remove(at: indexIng)
                }
            }
            else {
                print("🚨 ERROR: The ingredient is not in the pizza")
            }
        }
        else {
            print("🚨 ERROR: The pizza is not in the user list")
        }

    }

    private func getIndexPizza(pizza: Pizza) -> Int? {
        if let index = pizzas.firstIndex(of: pizza) {
            return index
        }
        return nil
    }

    private func getIndexIngredient(pizza: Pizza, ing: Ingredient) -> Int? {
        if let index = pizza.ingredients.firstIndex(of: ing) {
            return index
        }
        return nil
    }

    func resetCustomPizza(pizza: Pizza) {
        if let index = getIndexPizza(pizza: pizza) {
            pizzas[index].ingredients = []
        }
    }
}
