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
        XCTAssertEqual(Mock.pizzas[0].ingredients.count, 0)
        order.addIngredient(ing: Mock.ingredients[0], pizza: Mock.pizzas[0])
        XCTAssertEqual(Mock.pizzas[0].ingredients.count, 1)
        order.addIngredient(ing: ingredients[1], pizza: Mock.pizzas[0])
        XCTAssertEqual(Mock.pizzas[0].ingredients.count, 2)
        XCTAssertEqual(Mock.pizzas[0].ingredients.first, ingredients[0])
        XCTAssertEqual(order.pizza[0].ingredients[1], ingredients[1])
    }

    func testRemoveIngredient() throws {
        order.addIngredient(ing: ingredients[0], pizza: Mock.pizzas[0])
        order.addIngredient(ing: ingredients[1], pizza: Mock.pizzas[0])
        order.addIngredient(ing: ingredients[2], pizza: Mock.pizzas[0])
        order.removeIngredient(ing: ingredients[0], pizza: Mock.pizzas[0])
        XCTAssertEqual(order.pizzas[0].ingredients.count, 2)
    }

    func testRemoveIngredientsToNone() throws {
        order.addIngredient(ing: ingredients[0], pizza: Mock.pizzas[0])
        order.addIngredient(ing: ingredients[1], pizza: Mock.pizzas[0])
        order.addIngredient(ing: ingredients[2], pizza: Mock.pizzas[0])
        order.removeIngredient(ing: ingredients[0], pizza: Mock.pizzas[0])
        order.removeIngredient(ing: ingredients[1], pizza: Mock.pizzas[0])
        order.removeIngredient(ing: ingredients[2], pizza: Mock.pizzas[0])
        XCTAssertEqual(order.pizzas[0].ingredients, [])
        XCTAssertEqual(order.pizzas[0].ingredients.count, 0)
    }

    func testResetCustomPizza() throws {
        order.addIngredient(ing: ingredients[0], pizza: Mock.pizzas[2])
        order.addIngredient(ing: ingredients[1], pizza: Mock.pizzas[2])
        order.addIngredient(ing: ingredients[2], pizza: order.pizzas[2])
        order.resetCustomPizza(pizza: order.pizzas[2])
        XCTAssertEqual(order.pizzas[0].ingredients, [])
        XCTAssertEqual(order.pizzas[0].ingredients.count, 0)
    }

}
