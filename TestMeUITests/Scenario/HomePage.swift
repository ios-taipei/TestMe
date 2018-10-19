//
//  HomePage.swift
//  TestMeUITests
//
//  Created by aki.yu on 2018/10/4.
//  Copyright © 2018 aki.yu. All rights reserved.
//

import XCTest

class HomePage: Page {

//    required init() {
//        print("init")
//    }
    @discardableResult func checkPage() -> HomePage{
        
        print("check Home Page")
        
        let lblHome = findElement(.staticText)["我是首頁"]
        XCTAssertTrue(lblHome.exists)
        return self
    }
    
    
}
