//
//  LoginViewController.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var loginVM = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if loginVM.checkLogin(){
            let vc = storyboard?.instantiateViewController(identifier: "homeTVC") as! HomeTableViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        
        let result  = loginVM.doLogin(email: email, password: password)
        
        
        if result == "User" || result == "Admin" {
            
            UserDefaults.standard.set(result, forKey: "user-role")
            let vc = storyboard?.instantiateViewController(identifier: "homeTVC") as! HomeTableViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            showAlert(message: result)
        }
        
    }
    
    
    func showAlert(message : String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                print("test")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
