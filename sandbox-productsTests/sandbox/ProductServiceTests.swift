//
//  ProductServiceTests.swift
//  sandbox-productsTests
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import XCTest
@testable import sandbox_products

class ProductServiceTests: XCTestCase {

    var service: ProductService!
    var expectation: XCTestExpectation!
    var sandbox: Sandbox!
    var factory: SandboxModelFactory!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: ProductServiceTests.self)
        factory = SandboxModelFactory(bundle)
        expectation = expectation(description: "Loading sandbox")
        service = ProductService()
        service.delegate = self
        service.getSandbox()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSandboxLoadedCount() throws {
        waitForExpectations(timeout: 3)
        XCTAssertEqual(sandbox?.products.count, 3, "We should have loaded exactly 3 products.")
        XCTAssertEqual(sandbox?.spotlight.count, 2, "We should have loaded exactly 2 spotlight.")
        XCTAssertNotNil(sandbox?.cash, "We should have loaded exactly 1 cash.")
    }
    
    func testSandboxLoaded() throws {
        waitForExpectations(timeout: 3)
        XCTAssertNotNil(self.sandbox, "We should have loaded a sandbox")
    }
    
    func testCashExpectations() throws {
        waitForExpectations(timeout: 3)
        let expectationCash = factory.getExpectationData()?.cash
        let cash = sandbox?.cash
        XCTAssertEqual(cash?.description, expectationCash?.description, "We should have loaded a cash")
    }
    
    func testProductsExpectations() throws {
        waitForExpectations(timeout: 3)
        let productOne = sandbox?.products[0]
        let productTwo = sandbox?.products[1]
        let productThree = sandbox?.products[2]
        let expectationOne = factory.getExpectationData()?.products[0]
        let expectationTwo = factory.getExpectationData()?.products[1]
        let expectationThree = factory.getExpectationData()?.products[2]
        XCTAssertEqual(productOne?.description, expectationOne?.description, "We should have loaded a products 1")
        XCTAssertEqual(productTwo?.description, expectationTwo?.description, "We should have loaded a products 2")
        XCTAssertEqual(productThree?.description, expectationThree?.description, "We should have loaded a products 3")
    }
    
    func testSportlightExpectations() throws {
        waitForExpectations(timeout: 3)
        let spotlightOne = sandbox?.spotlight[0]
        let spotlightTwo = sandbox?.spotlight[1]
        let expectationOne = factory.getExpectationData()?.spotlight[0]
        let expectationTwo = factory.getExpectationData()?.spotlight[1]
        XCTAssertEqual(spotlightOne?.description, expectationOne?.description, "We should have loaded a spotlight 1")
        XCTAssertEqual(spotlightTwo?.description, expectationTwo?.description, "We should have loaded a spotlight 2")
    }
}

extension ProductServiceTests: ProductServiceDelegate {
    func getSandboxResult(_ sandbox: Sandbox) {
        self.sandbox = sandbox
        expectation.fulfill()
    }
}
