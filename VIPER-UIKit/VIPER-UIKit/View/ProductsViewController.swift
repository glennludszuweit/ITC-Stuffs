//
//  ViewController.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewProtocol {
    var presenter: PresenterProtocol?
    var productsList: [Product] = []
    
    func getProductsList(productsList: [Product]) {
        self.productsList = productsList
        DispatchQueue.main.async {
            self.productsTableView.reloadData()
        }
    }
    
   @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellXib = UINib(nibName: "ProductViewCell", bundle: nil)
        productsTableView.register(cellXib, forCellReuseIdentifier: "ProductViewCell")
        productsTableView.dataSource = self
        productsTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
        let data = productsList[indexPath.row]
        cell.imageProductThumb.loadImage(url: data.thumbnail, cell: cell.imageProductThumb)
        cell.labelProductTitle.text = data.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = productsList[indexPath.row]
        let productViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        productViewController.product = data
        self.navigationController?.pushViewController(productViewController, animated: true)
    }
}
