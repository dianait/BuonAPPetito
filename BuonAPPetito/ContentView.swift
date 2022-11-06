import SwiftUI

struct ContentView: View {
    @EnvironmentObject  var viewModel: OrderViewModel
    @State private var searchText = ""

    var body: some View {
        VStack {
            NavigationStack {
                headerView()
                inputView(text: $searchText).padding()
                ScrollView {
                    ForEach(searchResults) { pizza in
                        NavigationLink(destination:  DetailView(pizza: pizza)) {
                            rowView(pizza: pizza)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
    }

    var searchResults: [Pizza] {
          if searchText.isEmpty {
              return viewModel.pizzas
          } else {
              return viewModel.pizzas.filter { $0.name.contains(searchText) }
          }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(OrderViewModel())
    }
}
