//
//  ResetPassViewController.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 18/04/2023.
//

import UIKit

class ResetPassViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldEmail.placeholder = "Enter email address"
    }
    
    @IBAction func buttonResetPass(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
