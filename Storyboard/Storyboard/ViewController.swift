//
//  ViewController.swift
//  Storyboard
//
//  Created by Glenn Ludszuweit on 06/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToTableView(_ sender: Any) {
        let tableViewController = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        self.navigationController?.pushViewController(tableViewController, animated: true)
    }
    
    @IBAction func goToCollectionView(_ sender: Any) {
        let collectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        self.navigationController?.pushViewController(collectionViewController, animated: true)
    }
    
    @IBAction func goToWebView(_ sender: Any) {
        let webViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    
    @IBAction func goToUsersTable(_ sender: Any) {
        let usersTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "UsersTableViewController") as! UsersTableViewController
        self.navigationController?.pushViewController(usersTableViewController, animated: true)
    }
}

