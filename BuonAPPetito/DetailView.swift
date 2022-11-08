import SwiftUI

struct DetailView: View {
    @EnvironmentObject  var viewModel: OrderViewModel
    var pizza: Pizza
    @State var namePizza: String = " 🍽 Your custom pizza name"
    
    var body: some View {
        VStack {
            headerView()
            HStack {
                inputView(text: $namePizza, placeholder: "Choose the name of your pizza")
                Spacer()
                Text("\(pizza.price, specifier: "%.2f") €").bold() .font(.system(size: 20))
            }.padding()
            HStack {
                Image("pizzabox")
                    .resizable()
                    .frame(width: 80, height: 80)
                ForEach(viewModel.newPizza.ingredients.filter({ $0.isAdded })) { ing in
                    Text("\(ing.emoji)")
                }
            }

            Text("🥒 Custom your ingredients").font(.system(size: 20))
            ScrollView {
                ForEach(pizza.ingredients) { ing in
                    ingredientView(viewModel: viewModel, ing: ing)
                }
                Button(action: {
                    viewModel.newPizza.name = pizza.name
                    _ = viewModel.add(pizza: viewModel.newPizza)
                    print(viewModel.newPizza.ingredients.filter({$0.isAdded}))
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
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pizza: Mock.pizzas[3])
            .environmentObject(OrderViewModel())
    }
}
