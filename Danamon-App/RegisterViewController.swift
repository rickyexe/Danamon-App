//
//  RegisterViewController.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    @IBOutlet weak var roleSwitch: UISwitch!
    
    private var registerVM = RegisterViewModel()
    var role = "User"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func doRegister(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        guard let confirmationPassword = confirmationPasswordTextField.text else {
            return
        }
        
        let result = registerVM.doRegister(email: email, password: password, confirmationPassword: confirmationPassword, role: role)
        
        if result == 0 {
            showAlert(message: "Konfirmasi password tidak sama dengan password")
        }else if result == 1 {
            showAlert(message: "Email sudah terdaftar, silahkan login")
        }else if result == 2 {
//            showAlert(message: "Berhasil register, silahkan login")
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func changeRoleAction(_ sender: UISwitch) {
        if sender.isOn {
            role = "Admin"
        }else{
            role = "User"
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
