import SwiftUI

struct buttonView: View {
    var text: String

    var body: some View {
        Button(action: {
            print("Create your own pizza")
        }, label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(40)
                .shadow(radius: 2)
        })
    }
}

struct buttonView_Previews: PreviewProvider {
    static var previews: some View {
        buttonView(text: "👩‍🍳 Create your own pizza!")
    }
}
