import Foundation

class OrderViewModel: ObservableObject {

    let order: Order = Mock.order
    var ingredients = Mock.ingredients
    @Published var newPizza: Pizza = Pizza(id: 9, name: "")
    var customNamePizza: String = "Piccard"
    var pizzas: [Pizza] = Mock.pizzas
    @Published var total: Int = 0

    func add(pizza: Pizza) -> Int?  {
        order.addPizza(pizza: pizza)

        if let index = order.pizzas.firstIndex(of: pizza) {
            return index
        }
        else {
            return nil
        }
    }

    func remove(pizza: Pizza)  {
        order.removePizza(pizza: pizza)
    }

    func toggleIngredient(pizza: Pizza, ing: Ingredient, isAdded: Bool) {

        if let index = newPizza.ingredients.firstIndex(of: ing) {
            newPizza.ingredients[index].isAdded =  !newPizza.ingredients[index].isAdded
            print(newPizza.ingredients.filter({$0.isAdded}).count)
        }
    }

    func resetIngredients() {
        newPizza.ingredients = []
    }

    func getTotalPizzas() {
        total = order.getTotalNumOfPizzas()

    }
}
