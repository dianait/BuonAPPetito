import SwiftUI

struct headerView: View {
    @EnvironmentObject var viewModel: OrderViewModel

    var body: some View {
        ZStack {
            HStack {
                Text("🍕 BuonAPPetito").bold().font(.system(size: 18))
                Spacer()
                NavigationLink(destination:  CartView()) {
                    Image(systemName: "cart").font(.system(size: 24))
                        .foregroundColor(.black)
                }

            }.padding()
            Image(systemName:"\(viewModel.order.getTotalNumOfPizzas()).circle.fill").font(.system(size: 24))
                .background(.white)
                .foregroundColor(.red)
                .padding(.leading, 310)
                .padding(.top, 15)
        }

    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView().environmentObject(OrderViewModel())
    }
}
