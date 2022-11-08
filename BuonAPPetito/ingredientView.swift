import SwiftUI

struct ingredientView: View {
    @State var isAdded: Bool = true
    var viewModel: OrderViewModel
    var ing: Ingredient
    @State var pizza: Pizza

    var body: some View {
        VStack {
        HStack {
            Text("\(ing.name)").font(.system(size: 20))
            Spacer()
            Image(systemName: isAdded ? "minus.circle.fill" : "plus.circle.fill")
                .foregroundColor(isAdded ? .red : .green).font(.system(size: 24))
        } .padding()
            .onTapGesture {
                isAdded = !isAdded
                viewModel.toggleIngredient(pizza: pizza, ing: ing, isAdded: isAdded)
            }
        Divider()
        }
        .onAppear {
            // viewModel.order.pizzas.append(pizza)
            isAdded = ing.isAdded
        }
    }
}

struct ingredientView_Previews: PreviewProvider {
    static var previews: some View {
        ingredientView(viewModel: OrderViewModel(), ing: Mock.ingredients[0], pizza: Mock.pizzas[0])
    }
}
