//
//  LoginViewController.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 18/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldEmailUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldEmailUsername.placeholder = "Enter email or username"
        textFieldPassword.placeholder = "Enter password"
    }

    @IBAction func goToResetPassword(_ sender: Any) {
        let resetPassViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResetPassViewController") as! ResetPassViewController
        self.navigationController?.pushViewController(resetPassViewController, animated: true)
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}
