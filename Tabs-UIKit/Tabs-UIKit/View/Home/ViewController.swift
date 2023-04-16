//
//  ViewController.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonToUsers(_ sender: Any) {
       self.tabBarController!.selectedIndex = 1
    }
    
    @IBAction func buttonToLogin(_ sender: Any) {
       self.tabBarController!.selectedIndex = 2
    }
}

