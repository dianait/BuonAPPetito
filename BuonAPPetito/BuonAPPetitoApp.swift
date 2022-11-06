import SwiftUI

@main
struct BuonAPPetitoApp: App {
    @StateObject var viewModel = OrderViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
