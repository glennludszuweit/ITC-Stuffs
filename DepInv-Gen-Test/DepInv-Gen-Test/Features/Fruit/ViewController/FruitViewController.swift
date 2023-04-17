//
//  FruitViewController.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import UIKit

class FruitViewController: UIViewController {
    let fruitViewModel = FruitViewModel(networkManager: NetworkManager())
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellXib = UINib(nibName: "FruitViewCell", bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: "FruitViewCell")
        tableView.dataSource = self
        getFruits()
    }
    
    func getFruits() {
        fruitViewModel.getFruits {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension FruitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitViewModel.fruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitViewCell", for: indexPath) as! FruitViewCell
        let data = fruitViewModel.fruit[indexPath.row]
        cell.labelName.text = data.name
        return cell
    }
}
