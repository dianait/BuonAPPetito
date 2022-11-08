import XCTest


final class GoToCartUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()

        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }

    func testGoToCartWithoutAnyPizza() throws {
        goToCart()
        checkStaticText("📝 Your order")
        checkStaticText("💵 TOTAL: 0.00 €")
    }

    func testGoToCartWithOnePizza() throws {
        app.images["add Margarita pizza"].tap()
        goToCart()
        checkStaticText("📝 Your order")
        checkStaticText("Margarita")
        checkStaticText("1 x ")
        checkStaticText("9.90 €")
        checkStaticText("💵 TOTAL: 9.90 €")
    }

    func testGoToCartWithMorethanOnePizza() throws {
        addPizza("Margarita")
        addPizza("Diabolo")
        addPizza("Diabolo")
        goToCart()
        checkStaticText("📝 Your order")

        // Margarita total
        checkStaticText("Margarita")
        checkStaticText("1 x ")
        checkStaticText("9.90 €")

        // Diabolo total
        checkStaticText("Diabolo")
        checkStaticText("2 x ")
        checkStaticText("9.90 €")

        // Total
        checkStaticText("💵 TOTAL: 29.70 €")
    }

    func testRemoveOnePizza() throws {
        addPizza("Diabolo")
        addPizza("Diabolo")
        removePizza("Diabolo")
        goToCart()
        checkStaticText("Diabolo")
        checkStaticText("1 x ")
        checkStaticText("9.90 €")
        checkStaticText("💵 TOTAL: 9.90 €")
    }

    func goToCart() {
        app.buttons["Shopping Cart"].tap()
    }

    func checkStaticText(_ text: String) {
        XCTAssert(app.staticTexts[text].exists)
    }

    func addPizza(_ pizza: String) {
        app.images["add \(pizza) pizza"].tap()
    }

    func removePizza(_ pizza: String) {
        app.images["remove \(pizza) pizza"].tap()
    }
}
