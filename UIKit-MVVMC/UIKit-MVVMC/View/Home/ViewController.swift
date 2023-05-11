//
//  ViewController.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var homeCoordinator: HomeCoordinator?
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonToUsers(_ sender: Any) {
        homeCoordinator?.gotToUsers()
    }
    
    @IBAction func buttonToLogin(_ sender: Any) {
        homeCoordinator?.gotToLogin()
    }
}

