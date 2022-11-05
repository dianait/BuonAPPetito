import SwiftUI

struct ContentView: View {
    var viewModel: OrderViewModel = OrderViewModel()
    @State private var searchText = ""

    var body: some View {
        VStack {
            headerView()
            NavigationStack {
                inputView(text: $searchText).padding()
                ScrollView {
                    ForEach(searchResults) { pizza in
                        NavigationLink(destination:  rowView(pizza: pizza, viewModel: viewModel)) {
                            rowView(pizza: pizza, viewModel: viewModel)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                        }
                    }
                }
                NavigationLink(destination: customPizzaView(viewModel: viewModel)) {
                    Text("👩‍🍳 Create your own pizza!")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(40)
                        .shadow(radius: 2)
                }
            }


        }
    }

    var searchResults: [Pizza] {
          if searchText.isEmpty {
              return viewModel.order.pizzas
          } else {
              return viewModel.order.pizzas.filter { $0.name.contains(searchText) }
          }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
