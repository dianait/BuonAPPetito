import SwiftUI

struct headerView: View {
    var body: some View {
        HStack {
            Text("🍕 BuonAPPetito").bold().font(.system(size: 18))
            Spacer()
            Image(systemName: "cart")
                .font(.system(size: 24))
        }.padding()
    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView()
    }
}
