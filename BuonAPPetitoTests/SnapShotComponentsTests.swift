import XCTest
import SnapshotTesting
import SwiftUI
@testable import BuonAPPetito

final class SnapshotTests: XCTestCase {
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

    func testIngredientView() {
        let view = ingredientView(
            viewModel: OrderViewModel(),
            ing: BuonAPPetito.Mock.ingredients[0]).toView()
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }
}

    
