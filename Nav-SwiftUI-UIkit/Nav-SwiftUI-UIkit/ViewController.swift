//
//  ViewController.swift
//  Nav-SwiftUI-UIkit
//
//  Created by Glenn Ludszuweit on 26/04/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let username = UserDefaults.standard.string(forKey: "username")
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if username == nil {
            logoutButton.isHidden = true
        }
        
        if username != nil {
            usernameTextField.isHidden = true
        }
    }
    
    @IBAction func removeUserDefaults(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "username")
    }
    
    
    @IBAction func swiftUIView(_ sender: Any) {
        let uiKitView = UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController))
        
        if username == nil {
            UserDefaults.standard.set(usernameTextField.text, forKey: "username")
            navigationController?.pushViewController(uiKitView, animated: true)
        }
    }
}

