//
//  LoginViewController.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import UIKit

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldEmailUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var authCoordinator: AuthCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldEmailUsername.placeholder = "Enter email or username"
        textFieldPassword.placeholder = "Enter password"
    }

    @IBAction func goToResetPassword(_ sender: Any) {
        authCoordinator?.goToResetPass()
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        authCoordinator?.goToRegister()
    }
    
}
