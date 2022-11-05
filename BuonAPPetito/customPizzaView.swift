import SwiftUI

struct customPizzaView: View {

    var viewModel: OrderViewModel
    @State private var nameCustomPizza = "Piccard"
    var customPizza : Pizza = Pizza(id: 8, name: "")

    
    var body: some View {
        VStack {
            Text("🥒 Ingredients").font(.system(size: 32))
            Button(action: {
                nameCustomPizza = "Uhura"
            }, label: {
                Text("🖖 Get random freak name")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(40)
                    .shadow(radius: 2)
            })
            Text("Pizza's name: \(nameCustomPizza)")
            ScrollView {
                ForEach(viewModel.ingredients) { ing in
                    HStack {
                        Text("\(ing.name)").font(.system(size: 20))
                        Spacer()
                        Image(systemName: ing.isAdded ? "minus.circle.fill" : "plus.circle.fill") .foregroundColor(ing.isAdded ? .red : .green).font(.system(size: 24))
                    } .padding()
                        .onTapGesture {
                            viewModel.toggleIngredient(ing: ing)
                            print("You tapped \(ing.name)")
                            // print("Name -> \(nameCustomPizza)")
                            print("isAdded -> \(ing.isAdded)")
                        }
                    Divider()
                }
                
                ForEach(viewModel.newIngredientes) { ing in
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
