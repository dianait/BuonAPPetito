import XCTest
import SnapshotTesting
import SwiftUI
@testable import BuonAPPetito



final class SnapshotTests: XCTestCase {
    var pizza: BuonAPPetito.Pizza!

    override func setUpWithError() throws {
        try super.setUpWithError()
        pizza = BuonAPPetito.Mock.pizzas[2]

    }

    override func tearDownWithError() throws {
        pizza = nil
        try super.tearDownWithError()
    }

    func testHaderView() {
        let view: UIView = headerView().environmentObject(OrderViewModel()).toView()
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testRowView() {
        let view = rowView(pizza: pizza).toView()
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testButtonView() {
        let view: UIView =  buttonView(text: "👩‍🍳 Create your own pizza!").toView()
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testInputView() {
        let view = inputView(text: .constant("Hola que tal")).toView()
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testContentView() {
        let view = ContentView().environmentObject(OrderViewModel()).toVC()
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
