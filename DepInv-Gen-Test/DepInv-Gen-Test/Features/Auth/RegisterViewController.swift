//
//  RegisterViewController.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 18/04/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldRepeatPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldEmail.placeholder = "Enter email address"
        textFieldUsername.placeholder = "Enter username"
        textFieldPassword.placeholder = "Enter password"
        textFieldRepeatPass.placeholder = "Repeat password"
    }
    
    @IBAction func buttonRegister(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
