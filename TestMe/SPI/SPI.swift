//
//  SPI.swift
//  TestMe
//
//  Created by aki.yu on 2018/10/8.
//  Copyright © 2018 aki.yu. All rights reserved.
//

import UIKit

class SPI {

    #if DEBUG
        let spi_url = "http://localhost:3000"
    #else
        let spi_url = "https://real.server.url"
    #endif
 
    var defaultSession : URLSession = URLSession.shared
    
    func login(acc:String,pass:String, completion: @escaping (Data?, URLResponse?,
        Error?)->Void ) {
        
        print("\(spi_url)/login")
        var request = URLRequest(url: URL(string: spi_url+"/login")!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = "{\"acc\":\"\(acc)\",\"pass\":\"\(pass)\"}".data(using: .utf8)!
        let task = defaultSession.dataTask(with: request, completionHandler: { (data, response,
            error) in
            DispatchQueue.main.async {
                completion(data,response,error)
            }
            
        })
        task.resume()
        
    }
}
