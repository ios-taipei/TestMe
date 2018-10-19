//
//  ViewController.swift
//  TestMe
//
//  Created by aki.yu on 2018/10/4.
//  Copyright © 2018 aki.yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textAccount: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnLogin(_ sender: Any) {
        
        //textAccount.text == "aki" &&  == "qaz"
        let spi = SPI()
        
        spi.login(acc: textAccount.text!, pass: textPassword.text!) { (data, response, error) in
            
            if error != nil{
                print(error!.localizedDescription)
            }else{
                if let urlContent = data{
                    do{
                        let jsonresult =   (try  JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)) as! [String:Any]
                       
                        if jsonresult["status"] as! String == "ok" {
                            self.performSegue(withIdentifier: "segueToHome", sender: self)
                        }else{
                            let alert = UIAlertController(title: "", message: "帳號密碼錯誤", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
       
    }
 
    
}

