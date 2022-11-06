import Foundation

class OrderViewModel: ObservableObject {

    let order: Order = Mock.order
    var ingredients = Mock.ingredients
    @Published var newPizza: Pizza = Pizza(id: 9, name: "")
    var customNamePizza: String = "Piccard"

    func add(pizza: Pizza)  {
        order.addPizza(pizza: pizza)
    }

    func remove(pizza: Pizza)  {
        order.removePizza(pizza: pizza)
    }

    func toggleIngredient(ing: Ingredient) {
        var ing2 = ing
        ing2.isAdded = !ing2.isAdded
        if (newPizza.ingredients.count == 0) {
            newPizza.name = customNamePizza
            newPizza.ingredients.append(ing2)
        }
        else {
            if let index = order.getIndexIngredient(pizza: newPizza, ing: ing2) {
                newPizza.ingredients.remove(at: index)
            }
            else {
                print("🚨 ERROR: The ingredient is not in the pizza")

            }

        }
    }

    func resetIngredients() {
        newPizza.ingredients = []
    }

}
