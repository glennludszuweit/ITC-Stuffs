//
//  ViewController.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

class ProductsViewController: UIViewController, ViewProtocol {
    var presenter: PresenterProtocol?
    
    func getProductsList(productsList: [Product]) {
        print(productsList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
