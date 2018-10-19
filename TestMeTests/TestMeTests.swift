//
//  TestMeTests.swift
//  TestMeTests
//
//  Created by aki.yu on 2018/10/4.
//  Copyright © 2018 aki.yu. All rights reserved.
//

import XCTest
@testable import TestMe

class TestMeTests: XCTestCase {

    lazy var spi : SPI = {
        return SPI()
    }()
    
   
    var sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    
    override func setUp() {
        super.setUp()
        
        spi.defaultSession = sessionUnderTest
    }
    
    func matcher(request:URLRequest) -> Bool {
        
        return true  // Let's match this request
    }

    override func tearDown() {
        
    }

    func testLoginSuccess() {
        
        let expectation = XCTestExpectation(description: "wait for spi return success")
        
        spi.login(acc: "aki", pass: "qaz") { (data, response, error) in
            
            if error != nil {
                print("Error: \(error!.localizedDescription)")
                expectation.fulfill()
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options:[])
                XCTAssertEqual((json as! [String:String])["status"]!, "ok")
            }
            catch {
                XCTAssert(false)
            }
            expectation.fulfill()
        }
        
         wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testLoginFailed() {
        
        let expectation = XCTestExpectation(description: "wait for spi return failed")
        
        spi.login(acc: "aki", pass: "123") { (data, response, error) in
            
            if error != nil {
                print("Error: \(error!.localizedDescription)")
                expectation.fulfill()
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options:[])
                XCTAssertEqual((json as! [String:String])["status"]!, "failed")
            }
            catch {
                XCTAssert(false)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
}
