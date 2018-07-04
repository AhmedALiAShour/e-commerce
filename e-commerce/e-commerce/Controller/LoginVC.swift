//
//  LoginVC.swift
//  e-commerce
//
//  Created by ahmed on 6/29/18.
//  Copyright © 2018 Organization. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginVC: UIViewController {

    
   
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var langTF: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func loginPressed(_ sender: Any) {
        guard let username = usernameTF.text, !username.isEmpty else {return}
        guard let password = passwordTF.text, !password.isEmpty else {return}
        guard let lang = langTF.text, !lang.isEmpty else {return}
        
        let url = "https://www.oxygenislands.com/API/login_api.php"
        
        let parameters = [
            "username" : username,
            "password": password,
            "lang": lang
            
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    print(error)
                    
                case .success(let value):
                    print(value)
                    let json = JSON(value)
                    let user_email = json["data"][0]["user_email"].string
                    print("useremail \(String(describing: user_email))")
                    let user_login = json["data"][0]["user_login"].string
                    print("userlogin \(String(describing: user_login))")
                    let user_id = json["data"][0]["user_id"].string
                    print("userid \(String(describing: user_id))")
                    let def = UserDefaults.standard
                    def.setValue(user_login, forKey: "user_login")
                    def.synchronize()
                    self.dismiss(animated: true, completion: { self.reloadInputViews() })
                    
                    /* restart app 
                    guard let window = UIApplication.shared.keyWindow else {return}
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    var vc: UIViewController
                    vc = sb.instantiateViewController(withIdentifier: "CategoriesVC")
                    window.rootViewController = vc
                    UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
                    */
                        }
                    }
        
                }
    
    @IBAction func backToHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


    
    
    

