//
//  UsersViewController.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import UIKit

class UsersViewController: UIViewController {
    let userViewModel = UserViewModel(userService: UserService())
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellXib = UINib(nibName: "UserTableViewCell", bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: "UserTableViewCell")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let data = userViewModel.users[indexPath.row]
        cell.labelUserNameView.text = data.name
        cell.labelUserEmailView.text = data.email
        cell.labelUserWebsiteView.text = data.website.capitalized
        cell.user = data
        cell.passUserData = { user in
            let userViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
            userViewController.user = user
            self.navigationController?.pushViewController(userViewController, animated: true)
        }
        return cell
    }
}
