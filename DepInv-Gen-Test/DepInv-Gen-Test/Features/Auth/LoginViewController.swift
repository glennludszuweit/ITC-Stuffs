//
//  LoginViewController.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 18/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldEmailUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldEmailUsername.placeholder = "Enter email or username"
        textFieldPassword.placeholder = "Enter password"
        
        
    }
    
    func fetchDataWithBGQueue() {
        DispatchQueue.global(qos: .userInitiated).async {
            let decoder = JSONDecoder()
            let url = URL(string: "https://fruityvice.com/api/fruit/all")!
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
                guard error == nil else { return }
                guard let data = data else { return }
                do {
                    let jsonData = try decoder.decode([Fruit].self, from: data)
                    print(jsonData)
                } catch {
                    print(error)
                }
            }
            .resume()
        }
    }
    
    @IBAction func goToResetPassword(_ sender: Any) {
        let resetPassViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResetPassViewController") as! ResetPassViewController
        self.navigationController?.pushViewController(resetPassViewController, animated: true)
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @IBAction func buttonLoginSubmit(_ sender: Any) {
        fetchDataWithBGQueue()
    }
}
