import SwiftUI

struct DetailView: View {
    var viewModel: OrderViewModel
    
    var body: some View {
        VStack {
            Text("🥒 Ingredients").font(.system(size: 28))
            Text("Pizza's name: \(viewModel.customNamePizza)")
            customPizzaView(viewModel: viewModel)
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: OrderViewModel())
    }
}
