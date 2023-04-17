//
//  ViewController.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 17/04/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonFruitsView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fruitViewController = storyboard.instantiateViewController(withIdentifier: "FruitViewController") as! FruitViewController
        self.navigationController?.pushViewController(fruitViewController, animated: true)
    }
    

    @IBAction func buttonUsersView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let usersViewController = storyboard.instantiateViewController(withIdentifier: "UsersViewController") as! UsersViewController
        self.navigationController?.pushViewController(usersViewController, animated: true)
    }
}
