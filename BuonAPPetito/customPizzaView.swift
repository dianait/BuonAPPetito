import SwiftUI

struct customPizzaView: View {

    var viewModel: OrderViewModel
    @State var isAdded: Bool = false
    
    var body: some View {
        VStack {
            Text("🥒 Ingredients").font(.system(size: 28))
            Text("Pizza's name: \(viewModel.customNamePizza)")
            ScrollView {
                Text("list")
                ForEach(viewModel.ingredients) { ing in
                    HStack {
                        Text("\(ing.name)").font(.system(size: 20))
                        Spacer()
                        Image(systemName: isAdded ? "minus.circle.fill" : "plus.circle.fill")
                            .foregroundColor(isAdded ? .red : .green).font(.system(size: 24))
                    } .padding()
                        .onTapGesture {
                            isAdded = !isAdded
                            viewModel.toggleIngredient(ing: ing)
                            print("You tapped \(ing.name)")
                            viewModel.newPizza.ingredients = viewModel.newIngredientes
                            print(viewModel.newIngredientes.count)
                        }
                    Divider()
                }
                Text("added")
                ForEach(viewModel.newPizza.ingredients) { ing in
                    HStack {
                        Text("\(ing.name)").font(.system(size: 20))
                        
                    }
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
