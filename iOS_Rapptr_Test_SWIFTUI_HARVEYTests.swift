//
//  iOS_Rapptr_Test_SWIFTUI_HARVEYTests.swift
//  iOS Rapptr Test SWIFTUI HARVEYTests
//
//  Created by Anthony Harvey on 4/29/22.
//

import XCTest
@testable import iOS_Rapptr_Test_SWIFTUI_HARVEY

class iOS_Rapptr_Test_SWIFTUI_HARVEYTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringisValidEmailMethod_WhenValidEmailProvided_ShouldReturnTrue() {
        let isEmailValid = "MyEmail@gmail.com".isValidEmail
        XCTAssertTrue(isEmailValid, "a valid email failed isValidEmail test")
    }

    func testStringisValidEmailMethod_WhenInvalidEmailIsProvided_ShouldReturnFalse() {
        let isEmailValid = "MyEmail@gmail@com".isValidEmail
        XCTAssertFalse(isEmailValid, "an invalid email did not fail isValidEmail test")
    }

}



