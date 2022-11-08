import SwiftUI

struct DetailView: View {
    @EnvironmentObject  var viewModel: OrderViewModel
    var pizza: Pizza
    
    var body: some View {
        VStack {
            headerView()
            rowView(pizza: pizza)
            Text("🥒 Ingredients").font(.system(size: 20))
            customPizzaView(pizza: pizza)
            Button(action: {
                viewModel.add(pizza: pizza)
                viewModel.getTotalPizzas()
                print("🛒 Add to cart")
            }, label: {
                Text("🛒 Add to cart")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(40)
                    .shadow(radius: 2)
            })
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pizza: Mock.pizzas[3])
            .environmentObject(OrderViewModel())
    }
}
