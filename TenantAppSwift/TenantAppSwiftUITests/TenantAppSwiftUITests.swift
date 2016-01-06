//
//  TenantAppSwiftUITests.swift
//  TenantAppSwiftUITests
//
//  Created by Alix on 17/12/2015.
//  Copyright © 2015 TenantTeam. All rights reserved.
//

import XCTest

class TenantAppSwiftUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        
        let app = XCUIApplication()
        let signUpButton = app.buttons["Sign Up"]
        signUpButton.tap()
        
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("spider")
        app.otherElements["spiderman"].tap()
        
        let firstnameTextField = app.textFields["Firstname"]
        firstnameTextField.tap()
        firstnameTextField.typeText("spider")
        
        let lastnameTextField = app.textFields["Lastname"]
        lastnameTextField.tap()
        lastnameTextField.typeText("man")
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("spider@man.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("spiderman")
        signUpButton.tap()
        
        let window = app.childrenMatchingType(.Window).elementBoundByIndex(0)
        let element = window.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element
        let textField = element.childrenMatchingType(.TextField).elementBoundByIndex(0)
        textField.tap()
        textField.typeText("ce")
        
        let centralElement = app.otherElements["central"]
        centralElement.tap()
        
        let textField2 = element.childrenMatchingType(.TextField).elementBoundByIndex(1)
        textField2.tap()
        textField2.typeText("wagon")
        
        let textField3 = element.childrenMatchingType(.TextField).elementBoundByIndex(2)
        textField3.tap()
        
        let moreNumbersKey = app.keys["more, numbers"]
        moreNumbersKey.tap()
        moreNumbersKey.tap()
        textField3.typeText("10")
        app.keys["0"].tap()
        textField3.typeText("00")
        
        let textField4 = element.childrenMatchingType(.TextField).elementBoundByIndex(3)
        textField4.tap()
        moreNumbersKey.tap()
        moreNumbersKey.tap()
        app.keys["3"].tap()
        textField4.typeText("3")
        textField4.typeText("0")
        element.tap()
        app.buttons["Load picture"].tap()
        app.tables.buttons["Camera Roll"].tap()
        app.collectionViews.cells["Photo, Landscape, August 08, 2012, 2:55 PM"].tap()
        app.buttons["Next"].tap()
        
        let element2 = window.childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).element
        let textField5 = element2.childrenMatchingType(.TextField).elementBoundByIndex(1)
        textField5.tap()
        textField5.typeText("ce")
        centralElement.tap()
        
        let textField6 = element2.childrenMatchingType(.TextField).elementBoundByIndex(2)
        textField6.tap()
        textField6.typeText("w")
        moreNumbersKey.tap()
        moreNumbersKey.tap()
        app.keys["5"].tap()
        textField6.typeText("5")
        
        let textField7 = element2.childrenMatchingType(.TextField).elementBoundByIndex(3)
        textField7.tap()
        textField7.typeText("su")
        app.otherElements["Sullivan"].tap()
        
        let textField8 = element2.childrenMatchingType(.TextField).elementBoundByIndex(4)
        textField8.tap()
        textField8.typeText("flat")
        
        let textField9 = element2.childrenMatchingType(.TextField).elementBoundByIndex(5)
        textField9.tap()
        moreNumbersKey.tap()
        moreNumbersKey.tap()
        textField9.typeText("2011-08")
        
        let textField10 = element2.childrenMatchingType(.TextField).elementBoundByIndex(6)
        textField10.tap()
        moreNumbersKey.tap()
        moreNumbersKey.tap()
        textField10.typeText("2012")
        app.keys["more, letters"].tap()
        moreNumbersKey.tap()
        textField10.typeText("-04")
        
        let textField11 = element2.childrenMatchingType(.TextField).elementBoundByIndex(7)
        textField11.tap()
        textField11.tap()
        textField11.typeText("fok")
        app.otherElements["Fokker"].tap()
        
        let textField12 = element2.childrenMatchingType(.TextField).elementBoundByIndex(8)
        textField12.tap()
        moreNumbersKey.tap()
        textField12.typeText("1234")
        
        let textField13 = element2.childrenMatchingType(.TextField).elementBoundByIndex(9)
        textField13.tap()
        moreNumbersKey.tap()
        moreNumbersKey.tap()
        textField13.typeText("2")
        
        let textField14 = element2.childrenMatchingType(.TextField).elementBoundByIndex(10)
        textField14.tap()
        moreNumbersKey.tap()
        textField14.typeText("3000")
        element2.childrenMatchingType(.TextField).elementBoundByIndex(11).tap()
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
