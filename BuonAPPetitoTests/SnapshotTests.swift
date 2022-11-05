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
        let headerView = headerView()
        let view: UIView = UIHostingController(rootView: headerView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testRowView() {
        let headerView = rowView(pizza: pizza, viewModel: OrderViewModel())
        let view: UIView = UIHostingController(rootView: headerView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testButtonView() {
        let headerView = buttonView(text: "👩‍🍳 Create your own pizza!")
        let view: UIView = UIHostingController(rootView: headerView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testInputView() {
        let headerView = inputView(text: .constant("Hola que tal"))
        let view: UIView = UIHostingController(rootView: headerView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

    func testContentView() {
        let headerView = ContentView()
        let view: UIView = UIHostingController(rootView: headerView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }

}

