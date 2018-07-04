//
//  RegisterVC.swift
//  e-commerce
//
//  Created by ahmed on 7/1/18.
//  Copyright © 2018 Organization. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var langTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        guard let username = usernameTF.text?.trimmed, !username.isEmpty else {return}
        guard let email = emailTF.text, !email.isEmpty else {return}
        guard let password = passwordTF.text, !password.isEmpty else {return}
        guard let lang = langTF.text, !lang.isEmpty else {return}
        
        let url = "https://www.oxygenislands.com/API/register_api.php"
        
        let parameters = [
            "username" : username,
            "email": email,
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
                    let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                    self.present(secondViewController, animated: true)
                    }
                }
        }
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
        
    }
    


