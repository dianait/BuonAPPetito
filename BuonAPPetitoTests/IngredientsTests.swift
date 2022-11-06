import XCTest

final class IngredientsTests: XCTestCase {
    var order: Order!
    var ingredients: [Ingredient]!
    var pizza: Pizza!

    override func setUpWithError() throws {
        try super.setUpWithError()

        order = Mock.order
        ingredients = Mock.ingredients
    }

    override func tearDownWithError() throws {
        order = nil
        ingredients = nil

        try super.tearDownWithError()
    }

    func testCreateCustomPizza() throws {
        let pizza = Pizza(id: 456, name: "customPizza")
        XCTAssertEqual(pizza.ingredients.count, 0)
    }

    func testAddIngredient() throws {
        XCTAssertEqual(order.pizzas[0].ingredients.count, 0)
        order.addIngredient(ing: ingredients[0], pizza: order.pizzas[0])
        XCTAssertEqual(order.pizzas[0].ingredients.count, 1)
        XCTAssertEqual(order.pizzas[0].ingredients.first, ingredients[0])
    }

}
