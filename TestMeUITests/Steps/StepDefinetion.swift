//
//  switch_steps.swift
//  FoodTrackerUITests
//
//  Created by Jersey Su on 2018/5/15.
//  Copyright © 2018 Mario Ban. All rights reserved.
//

import XCTest
import Cucumberish

class StepDefinetion: NSObject {
    
    var application : XCUIApplication!
    
    func setup(_ application: XCUIApplication)
    {
        self.application = application
        
        Given("the app is running") { (args, userInfo) -> Void in
            LoginPage().checkPage()
        }
        
        When("I enter Account \"([^\\\"]*)\" and Password \"([^\\\"]*)\""){(args,userInfo)->Void in
            
            guard let acc = args?[0] , let pass = args?[1]
                else {
                    XCTAssert(false)
                    return
            }
            LoginPage().inputData(acc, pass)
            LoginPage().clickLogin()
            
        }
        
        Then("I should see \"([^\\\"]*)\""){(args,userInfo)->Void in
            
            guard let expectedResult = args?[0]
                else {
                XCTAssert(false)
                return
            }
            if expectedResult == "success" {
                HomePage().checkPage()
            }else{
                LoginPage().clickAlert(expectedResult)
            }
            
        }
        
    }
    
    class func setup(_ application: XCUIApplication)
    {
        StepDefinetion().setup(application)
    }
}
