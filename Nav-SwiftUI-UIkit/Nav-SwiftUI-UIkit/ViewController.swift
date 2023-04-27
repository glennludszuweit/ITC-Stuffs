//
//  ViewController.swift
//  Nav-SwiftUI-UIkit
//
//  Created by Glenn Ludszuweit on 26/04/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let username = UserDefaults.standard.string(forKey: "com.ghl.Nav-SwiftUI-UIkit.username")
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var buttonText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if username == nil {
            logoutButton.isHidden = true
            buttonText.setTitle("Login", for: .normal)
        }
        
        if username != nil {
            usernameTextField.isHidden = true
            buttonText.setTitle("SwiftUI View", for: .normal)
        }
    }
    
    @IBAction func removeUserDefaults(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "com.ghl.Nav-SwiftUI-UIkit.username")
    }
    
    
    @IBAction func swiftUIView(_ sender: Any) {
        let uiKitView = UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController))
        
        if username == nil {
            UserDefaults.standard.set(usernameTextField.text, forKey: "com.ghl.Nav-SwiftUI-UIkit.username")
            buttonText.isHidden = false
        }
        
        if username != nil {
            navigationController?.pushViewController(uiKitView, animated: true)
        }
    }
}

