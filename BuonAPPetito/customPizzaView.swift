import SwiftUI

struct customPizzaView: View {
    var viewModel: OrderViewModel

    
    var body: some View {
        VStack {
            Text("🥒 Ingredients").font(.system(size: 28))
            Text("Pizza's name: \(viewModel.customNamePizza)")
            ScrollView {
                ForEach(viewModel.ingredients) { ing in
                    ingredientView(viewModel: viewModel, ing: ing)
                }
            }

            Button(action: {
                print("pizza ordered")
            }, label: {
                Text("🍕 Order pizza")
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

struct customPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        customPizzaView(viewModel: OrderViewModel())
    }
}
