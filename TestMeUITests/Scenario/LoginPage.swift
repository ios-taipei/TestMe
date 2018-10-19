//
//  LoginPage.swift
//  TestMeUITests
//
//  Created by aki.yu on 2018/10/4.
//  Copyright © 2018 aki.yu. All rights reserved.
//

import XCTest

class LoginPage: Page {
    private lazy var account = findElement(.textField)["textAccount"]
    private lazy var password = findElement(.secureTextField)["textPassword"]
    private lazy var btnLogin = findElement(.button)["btnLogin"]
    
    required init() {
        waitFor(element: account)
    }
    
    @discardableResult func checkPage() -> LoginPage{
        XCTAssertTrue(account.exists)
        XCTAssertTrue(password.exists)
        XCTAssertTrue(btnLogin.exists)
        return self
    }
    
    @discardableResult func inputData(_ acc: String, _ pass:String) -> LoginPage{
        account.tap()
        account.typeText(acc)
        password.tap()
        password.typeText(pass)
        return self
    }
   
    @discardableResult func clickLogin() ->LoginPage{
        btnLogin.tap()
        return self
    }
    
    @discardableResult func clickAlert(_ msg:String) ->LoginPage{
        let msgResult = findElement(.alert).element.staticTexts.element(boundBy: 0).label
        
        XCTAssertEqual(msg,msgResult)
        return self
    }
}
