import Foundation

class OrderViewModel: ObservableObject {

    let order: Order = Mock.order
    var ingredients = Mock.ingredients
    var newIngredientes: [Ingredient] = []
    @Published var newPizza: Pizza = Pizza(id: 9, name: "")
    var customNamePizza: String = "Piccard"

    func add(pizza: Pizza) -> Int {
        order.addPizza(pizza: pizza)
    }

    func remove(pizza: Pizza) -> Int {
        order.removePizza(pizza: pizza)
    }

    func toggleIngredient(ing: Ingredient) {
        var ing2 = ing
        ing2.isAdded = !ing2.isAdded
        if (newIngredientes.count == 0) {
            newPizza.name = customNamePizza
            newIngredientes.append(ing2)
        }
        else {
            newIngredientes.removeLast()
        }

        newPizza.ingredients = newIngredientes

}

    }
