import SwiftUI

struct rowView: View {
    var pizza: Pizza
    @State var counter: Int = 0
    @EnvironmentObject  var viewModel: OrderViewModel

    var body: some View {
        VStack {
            HStack {
                Text(pizza.name)
                Text("\(pizza.price, specifier: "%.2f") €").bold() .font(.system(size: 20))
                Spacer()
                Image("pizzabox")
                    .resizable()
                    .frame(width: 80, height: 80)
                Spacer()

                Image(systemName: "plus.circle.fill") .foregroundColor(.green).font(.system(size: 24))
                    .accessibilityIdentifier("add \(pizza.name) pizza")
                    .onTapGesture {
                        viewModel.add(pizza: pizza)
                        self.counter += 1
                        viewModel.getTotalPizzas()

                    }
                Text("\(counter)")
                    .accessibilityIdentifier("\(pizza.name) count")
                Image(systemName:"minus.circle.fill" )
                    .foregroundColor(counter < 1 ? .gray : .red).font(.system(size: 24))
                    .accessibilityIdentifier("remove \(pizza.name) pizza")
                    .onTapGesture {
                        if (counter > 0) {
                            self.counter -= 1
                            viewModel.remove(pizza: pizza)
                            viewModel.getTotalPizzas()
                        }


                    }
            }.foregroundColor(.black)
            Divider()
        }
    }
}

struct rowView_Previews: PreviewProvider {
    static var previews: some View {
        rowView(pizza: Mock.pizzas[0])
            .padding()
            .environmentObject(OrderViewModel())
    }
}
