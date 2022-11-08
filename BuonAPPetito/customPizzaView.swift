import SwiftUI

struct customPizzaView: View {
    @EnvironmentObject  var viewModel: OrderViewModel
    var pizza: Pizza

    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(pizza.ingredients) { ing in
                    ingredientView(viewModel: viewModel, ing: ing, pizza: pizza)
                }
            }
        }

    }
}

struct customPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        customPizzaView(pizza: Mock.pizzas[2])
            .environmentObject(OrderViewModel())
    }
}
