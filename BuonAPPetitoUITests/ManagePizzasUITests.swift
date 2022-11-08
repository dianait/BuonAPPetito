import XCTest

final class ManagePizzasUITests: XCTestCase {
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

    func testAddPizza() throws {
        addPizza("Margarita")
        addPizza("Diabolo")
        addPizza("Diabolo")
        // let margaritaCounter = app.staticTexts["Margarita count"]
        // let diaboloCounter = app.staticTexts["Diabolo count"].value as! String
        // XCTAssertEqual(margaritaCounter, "1")
        // XCTAssertEqual(diaboloCounter, "2")
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
