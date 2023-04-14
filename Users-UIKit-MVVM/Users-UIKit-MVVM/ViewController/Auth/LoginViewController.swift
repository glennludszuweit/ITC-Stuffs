//
//  ViewController.swift
//  Users-UIKit-MVVM
//
//  Created by Glenn Ludszuweit on 13/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    let authViewModel = AuthViewModel()
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldEmail.placeholder = "Enter email address"
        textFieldPassword.placeholder = "Enter password"
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAdminLogin(_ sender: Any) {
        let usersViewController = self.storyboard?.instantiateViewController(withIdentifier: "UsersViewController") as! UsersViewController
        let email = textFieldEmail.text
        let pass = textFieldPassword.text
        
        if authViewModel.validateAdminUser(email: email, pass: pass) {
            self.navigationController?.pushViewController(usersViewController, animated: true)
        } else {
            print("Invalid user!")
            let alert = UIAlertController(title: "Alert", message: "Invalid login details!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default))
            self.present(alert, animated: true)
        }
    }
    
}

