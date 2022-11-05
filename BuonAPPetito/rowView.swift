import SwiftUI

struct rowView: View {
    var pizza: Pizza
    var viewModel: OrderViewModel

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
                    .onTapGesture {
                        viewModel.add(pizza: pizza)
                    }
                Text("\(pizza.account)")
                Image(systemName:"minus.circle.fill" ) .foregroundColor(pizza.account < 1 ? .gray : .red).font(.system(size: 24))
                    .onTapGesture {
                        viewModel.remove(pizza: pizza)
                        print("klajdfklasjfklsdf")
                    }
            }.foregroundColor(.black)
            Divider()
        }
    }
}

struct rowView_Previews: PreviewProvider {
    static var previews: some View {
        rowView(pizza: Mock.pizzas[0], viewModel: OrderViewModel()).padding()
    }
}
