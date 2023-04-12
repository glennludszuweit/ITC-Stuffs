//
//  ViewController.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 07/04/2023.
//

import UIKit

class TableViewController: UIViewController {
    var fruitData = [Fruit]()
    let fruitController = NetworkServices()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellXib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: "TableViewCell")
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        getFruitData()
    }
    
    func getFruitData() {
        fruitController.getAllData { (result: Result<[Fruit] , Error >) in
            switch result {
            case .success(let fruit):
                self.fruitData = fruit
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func switchToGrid(_ sender: Any) {
        let collectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        collectionViewController.fruitData = self.fruitData
        self.navigationController?.pushViewController(collectionViewController, animated: true)
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let data = fruitData[indexPath.row]
        
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.fruit = data
        cell.labelFruitName.text = data.name
        cell.passDetailsData = { fruit in
            let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            detailsViewController.fruit = fruit
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let data = fruitData[indexPath.row]
        detailsViewController.fruit = data
//        disable cell selection
        tableView.allowsSelection = false
//        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}


