import SwiftUI

struct ingredientView: View {
    @State var isAdded: Bool = false
    var viewModel: OrderViewModel
    var ing: Ingredient

    var body: some View {
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
}

struct ingredientView_Previews: PreviewProvider {
    static var previews: some View {
        ingredientView(viewModel: OrderViewModel(), ing: Mock.ingredients[0])
    }
}
