//
//  ViewController.swift
//  Nav-SwiftUI-UIkit
//
//  Created by Glenn Ludszuweit on 26/04/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func swiftUIView(_ sender: Any) {
        let uiKitView = UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController))
        
        navigationController?.pushViewController(uiKitView, animated: true)
    }
}

