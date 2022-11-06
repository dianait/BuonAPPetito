import SwiftUI

struct CartView: View {
    var viewModel: OrderViewModel

    var body: some View {
        VStack {
            ForEach(viewModel.order.pizzas) { pizza in
                HStack {
                    Text(pizza.name)
                    Text("\(pizza.account) x ")
                    Text("\(pizza.price, specifier: "%.2f") € = \(pizza.price * Double(pizza.account) , specifier: "%.2f") €").bold() .font(.system(size: 20))
                    Spacer()
                }.padding()

            }
            Text("💵 TOTAL: \(viewModel.order.getAmount(), specifier: "%.2f") €").bold().font(.system(size: 20))
        }
        .onAppear{

        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: OrderViewModel())
    }
}
