import XCTest
@testable import BuonAPPetito

final class BuonAPPetitoTests: XCTestCase {
    var order: Order!
    var pizzas:  [Pizza]!
    var pizza: Pizza!

    override func setUpWithError() throws {
        order = Mock.order
        order.pizzas = Mock.pizzas
        pizza = Pizza(id: 1, name: "Hawai")
    }

    override func tearDownWithError() throws {
        order = nil
        pizzas = nil
    }

    func testInit() throws {
        XCTAssertEqual(order.pizzas.count, Mock.pizzas.count)
        XCTAssertEqual(order.pizzas.count, 5)
        XCTAssertEqual(order.pizzas, Mock.pizzas)
        XCTAssertEqual(order.pizzas.last?.name, "Etna")
        XCTAssertEqual(order.pizzas.first?.name, "Margarita")
        XCTAssertEqual(order.isOffer, false)
        XCTAssertEqual(order.getAmount(), 49.5)
        XCTAssertEqual(order.diss, 25)
    }

    func testAddNewPizza() throws {
        order.addPizza(pizza: pizza)
        XCTAssertEqual(order.pizzas.count, Mock.pizzas.count + 1)
        XCTAssertEqual(order.pizzas.last?.name, pizza.name)
    }


    func testRemovePizzaFromList() throws {
        order.addPizza(pizza: pizza)
        order.removePizza(pizza: pizza)
        XCTAssertEqual(order.pizzas.count, Mock.pizzas.count)
        XCTAssertEqual(order.pizzas.last?.name, Mock.pizzas.last?.name)
    }

    func testAddPizza() throws {
        order.addPizza(pizza: pizza)
        order.addPizza(pizza: pizza)
        let currentPizza = order.pizzas.filter({$0.name == pizza.name})
        XCTAssertEqual(currentPizza[0].account, 2)
    }

    func testReducePizza() throws {
        order.addPizza(pizza: pizza)
        order.addPizza(pizza: pizza)
        order.addPizza(pizza: pizza)
        order.removePizza(pizza: pizza)

        let currentPizza = order.pizzas.filter({$0.name == pizza.name})
        XCTAssertEqual(currentPizza[0].account, 2)
    }

    func testgetAmount() {
        XCTAssertEqual(order.getAmount(), 9.90 * 5.0)
    }

    func testgetAmountWithNewPizza() {
        order.addPizza(pizza: pizza)
        order.addPizza(pizza: pizza)
        XCTAssertEqual(order.getAmount(), 9.90 * 7.0)
    }

}

