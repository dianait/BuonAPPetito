import SwiftUI

struct DetailView: View {
    @EnvironmentObject  var viewModel: OrderViewModel
    var pizza: Pizza
    
    var body: some View {
        VStack {

            Text("🍕\(pizza.name)")
            Text("💵 \(pizza.price, specifier: "%.2f") €").bold() .font(.system(size: 20))
            Text("🥒 Ingredients").font(.system(size: 20))
            customPizzaView(pizza: pizza)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pizza: Mock.pizzas[3])
            .environmentObject(OrderViewModel())
    }
}
