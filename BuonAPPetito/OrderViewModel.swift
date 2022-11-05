import Foundation

class OrderViewModel: ObservableObject {

    let order: Order = Mock.order
    var ingredients = Mock.ingredients
    @Published var newIngredientes: [Ingredient] = []
    var newPizza: Pizza = Pizza(id: 9, name: "")
    @Published var customNamePizza: String = ""


    func add(pizza: Pizza) {
        _ = order.addPizza(pizza: pizza)
    }

    func remove(pizza: Pizza) {
        order.removePizza(pizza: pizza)
    }

    func toggleIngredient(ing: Ingredient) {
        if (newIngredientes.count == 0) {
            newPizza.name = customNamePizza
            
        }

}

    }
