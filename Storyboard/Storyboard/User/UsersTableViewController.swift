//
//  UsersTableViewController.swift
//  Storyboard
//
//  Created by Glenn Ludszuweit on 06/04/2023.
//

import UIKit

class UsersTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var usersData = [MockUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        readJSONFile()
        callApiToGetData()
        // Do any additional setup after loading the view.
    }
    
    func readJSONFile() {
        let bundle = Bundle(for: UsersTableViewController.self)
        guard let URL = bundle.url(forResource: "users", withExtension: "json") else { return }
        do {
            let data =  try Data(contentsOf: URL)
            let users = try JSONDecoder().decode([MockUser].self, from: data)
            usersData = users
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func callApiToGetData() {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error for response")
                return
            }
            
            guard let data = data else {
                print("Couldn't fetch data")
                return
            }
            
            do {
                let users = try JSONDecoder().decode([MockAPIUser].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(users)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension UsersTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let data = usersData[indexPath.row]
        cell.cellImage.consumeImageFromURL(from: data.avatar, cell: cell)
        cell.cellName.text = "\(data.lastName), \(data.firstName)"
        cell.cellEmail.text = data.email
        return cell
    }
}

extension UIImageView{
    func consumeImageFromURL(from url: String, cell: UITableViewCell) {
        guard let imageURL = URL(string: url) else { return }
            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.imageView!.image = image
            }
        }
    }
}
