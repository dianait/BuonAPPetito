import SwiftUI

struct DetailView: View {
    @EnvironmentObject  var viewModel: OrderViewModel
    var pizza: Pizza
    
    var body: some View {
        VStack {

            Text("Pizza's name: \(pizza.name)")
            Text("🥒 Ingredients").font(.system(size: 20))
            customPizzaView()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pizza: Mock.pizzas[3])
            .environmentObject(OrderViewModel())
    }
}
