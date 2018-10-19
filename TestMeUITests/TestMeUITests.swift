//
//  TestMeUITests.swift
//  TestMeUITests
//
//  Created by aki.yu on 2018/10/4.
//  Copyright © 2018 aki.yu. All rights reserved.
//

import XCTest
import Cucumberish
import Foundation

@objc class CucumberishInitializer: NSObject {
    @objc class func CucumberishSwiftInit()
    {
        //Using XCUIApplication only available in XCUI test targets not the normal Unit test targets.
        var application : XCUIApplication!
        
        //A closure that will be executed only before executing any of your features
        beforeStart { () -> Void in
            //Any global initialization can go here
            application = XCUIApplication()
            StepDefinetion().setup(application)
        }
        
        //Create a bundle for the folder that contains your "Features" folder. In this example, the CucumberishInitializer.swift file is in the same directory as the "Features" folder.
        let bundle = Bundle(for: CucumberishInitializer.self)
        
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
        
        before { (scenario: CCIScenarioDefinition?) in
            application.launchArguments.append("--UITests")
            application.launch()
        }
        
        after { (scenario: CCIScenarioDefinition?) in
            application.terminate()
        }
    }
}




//class TestMeUITests: XCTestCase {
//
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//
//    }
//
//}
