//
//  UserViewController.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import UIKit

class UsersViewController: UIViewController {
    let userViewModel = UserViewModel(networkManager: NetworkManager())
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellXib = UINib(nibName: "UserViewCell", bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: "UserViewCell")
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
        cell.labelName.text = data.name
        cell.labelEmail.text = data.email
        cell.labelWebsite.text = data.website.capitalized
        return cell
    }
}
