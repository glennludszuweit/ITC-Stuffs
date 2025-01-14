//
//  UsersViewController.swift
//  Users-UIKit-MVVM
//
//  Created by Glenn Ludszuweit on 13/04/2023.
//

import UIKit

class UsersViewController: UIViewController {
    let userViewModel = UserViewModel(userService: UserService())
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellXib = UINib(nibName: "UserViewCell", bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: "UserViewCell")
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.dataSource = self
        
        getUsers()
    }
    
    func getUsers() {
        userViewModel.getUsers {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell", for: indexPath) as! UserViewCell
        let data = userViewModel.users[indexPath.row]
        cell.labelUserName.text = data.name
        cell.labelUserEmail.text = data.email
        cell.labelUserWebsite.text = data.website.capitalized
        cell.user = data
        cell.passUserData = { user in
            let userViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
            userViewController.user = user
            self.navigationController?.pushViewController(userViewController, animated: true)
        }
        return cell
    }
}
