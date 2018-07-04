//
//  ViewController.swift
//  e-commerce
//
//  Created by ahmed on 6/27/18.
//  Copyright © 2018 Organization. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var CategoryTable: UITableView!
    @IBOutlet weak var userSV: UIStackView!
    @IBOutlet weak var viewlogin: UIButton!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var Logout: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryTable.dataSource = self
        CategoryTable.delegate = self
        let zero = 0
        /*check user log in*/
        let def = UserDefaults.standard
        if def.object(forKey: "user_login")as? Int != zero {
        if let user_login = def.object(forKey: "user_login") {
            userSV.isHidden = false
            viewlogin.isHidden = true
            userName.setTitle("Username: \(user_login)", for: .normal)
            userName.titleEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 2  )
        } else {
            userSV.isHidden = true
            viewlogin.isHidden = false
            
        }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell{
            let category = DataService.instance.getCategories()[indexPath.section]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        if screenHeight > 1000 {
            return 250
        } else {
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return   3
    }
 
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.section]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            assert(sender as? Category != nil)
            productsVC.initProducts(category: sender as! Category)
            
        }
    }

    
    @IBAction func NavigateLoginView(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present(loginVC, animated:true, completion:nil)
    }
    
    @IBAction func toggle(_ sender: Any) {
        if Logout.isHidden == true {
            Logout.isHidden = false
        }
        else{
            Logout.isHidden = true
        }
    }
    
    @IBAction func LogoutAction(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "user_login")
        UserDefaults.standard.synchronize()
        userSV.isHidden = true
        viewlogin.isHidden = false
    }

    
}
