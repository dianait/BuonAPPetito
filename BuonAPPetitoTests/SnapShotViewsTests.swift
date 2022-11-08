import XCTest
import SnapshotTesting
import SwiftUI
@testable import BuonAPPetito

final class SnapShotViewsTests: XCTestCase {
    var pizza: BuonAPPetito.Pizza!

    override func setUpWithError() throws {
        try super.setUpWithError()
        // isRecording = true

        pizza = BuonAPPetito.Mock.pizzas[2]
    }

    override func tearDownWithError() throws {
        pizza = nil

        try super.tearDownWithError()
    }

    func testContentView() {
        let view = ContentView().environmentObject(OrderViewModel()).toVC()
        assertSnapshot(matching: view, as: .image(on: .iPhone12))
    }

    func testCartViewWithoutPizza() {
        let view = CartView().environmentObject(OrderViewModel()).toVC()
        assertSnapshot(matching: view, as: .image(on: .iPhone12))
    }

    func testCartViewWithPizza() {
        let viewModel: OrderViewModel = OrderViewModel()
        viewModel.order.pizzas = BuonAPPetito.Mock.pizzas
        let view = CartView().environmentObject(viewModel).toVC()
        assertSnapshot(matching: view, as: .image(on: .iPhone12))
    }

    func testDetailView() {
        let viewModel: OrderViewModel = OrderViewModel()
        viewModel.order.pizzas = BuonAPPetito.Mock.pizzas
        let view = DetailView(pizza: viewModel.order.pizzas[0]).environmentObject(viewModel).toVC()
        assertSnapshot(matching: view, as: .image(on: .iPhone12))
    }

}

extension SwiftUI.View {
    func toView() -> UIView {
        let vc = UIHostingController(rootView: self)
        return vc.view
    }
}

extension SwiftUI.View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
