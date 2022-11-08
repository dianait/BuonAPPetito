import SwiftUI

struct ingredientView: View {
    @State var isAdded: Bool = true
    var viewModel: OrderViewModel
    var ing: Ingredient

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
                viewModel.toggleIngredient(ing: ing, isAdded: isAdded)
            }
        Divider()
        }
        .onAppear {
            isAdded = ing.isAdded
        }
    }
}

struct ingredientView_Previews: PreviewProvider {
    static var previews: some View {
        ingredientView(viewModel: OrderViewModel(), ing: Mock.ingredients[0])
    }
}
