import SwiftUI

struct CartView: View {
    @EnvironmentObject  var viewModel: OrderViewModel

    var body: some View {
        VStack {
            Text("📝 Your order")  .bold() .font(.system(size: 20))
            ScrollView {
                ForEach(viewModel.order.pizzas) { pizza in
                    VStack {
                        HStack {
                            Text(pizza.name)
                            Text("\(pizza.account) x ")
                            Text("\(pizza.price, specifier: "%.2f") €")
                            Spacer()
                            Text("\(pizza.price * Double(pizza.account) , specifier: "%.2f") €")
                                .bold() .font(.system(size: 20))
                        }.padding()
                        HStack {
                            ForEach(pizza.ingredients.filter({$0.isAdded})) { ing in
                                Text("\(ing.emoji)")
                            }
                        }

                    }

                    Divider()
                }
            }

            Text("💵 TOTAL: \(viewModel.order.getAmount(), specifier: "%.2f") €")
                .bold().font(.system(size: 20))
            Button(action: {
                print("💳 pay now")
            }, label: {
                Text("💳 Checkout")
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(OrderViewModel())
    }
}
