//
//  CurrencyConverterTests.swift
//  CurrencyConverterTests
//
//  Created by Никита on 13.02.22.
//

import XCTest
@testable import CurrencyConverter

class CurrencyConverterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalculateFuncFromEURToUSD() {
        let moneyTest1 = Currency(moneySumM: 100.0,typeCurrencyM: "EUR", boolFlagM: true)
        let moneyTest2 = Currency(moneySumM: 125.0, typeCurrencyM: "USD", boolFlagM: false)
        XCTAssert(moneyTest2.moneySum == 1.25 * moneyTest1.moneySum)
    }
    
    func testCalculateFuncFromEURToRUS() {
        let moneyTest1 = Currency(moneySumM: 58.5,typeCurrencyM: "EUR", boolFlagM: true)
        let moneyTest2 = Currency(moneySumM: 146.25, typeCurrencyM: "RUS", boolFlagM: false)
        XCTAssert(moneyTest2.moneySum == 1.25 * 2 * moneyTest1.moneySum)
    }
    
    func testCalculateFuncFromBYNToEUR() {
        let moneyTest1 = Currency(moneySumM: 183.5875,typeCurrencyM: "EUR", boolFlagM: false)
        let moneyTest2 = Currency(moneySumM: 734.35, typeCurrencyM: "BYN", boolFlagM: true)
        XCTAssert(moneyTest2.moneySum * (1 / 4) == moneyTest1.moneySum)
    }
    
    func testCalculateFuncFromRUSToBYN() {
        let moneyTest1 = Currency(moneySumM: 135.648,typeCurrencyM: "BYN", boolFlagM: false)
        let moneyTest2 = Currency(moneySumM: 84.78, typeCurrencyM: "RUS", boolFlagM: true)
        XCTAssert(moneyTest2.moneySum * 1.6 == moneyTest1.moneySum)
    }
    
    func testCalculateFuncFromUSDToBYN() {
        let moneyTest1 = Currency(moneySumM: 10.127,typeCurrencyM: "USD", boolFlagM: true)
        let moneyTest2 = Currency(moneySumM: 40.508, typeCurrencyM: "BYN", boolFlagM: false)
        XCTAssert(moneyTest2.moneySum == moneyTest1.moneySum * 4)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
