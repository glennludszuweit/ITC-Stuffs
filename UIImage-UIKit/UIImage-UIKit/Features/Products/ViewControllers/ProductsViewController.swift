//
//  ViewController.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let productsViewModel = ProductViewModel(networkManager: NetworkManager())
    
    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellXib = UINib(nibName: "ProductViewCell", bundle: nil)
        productsTableView.register(cellXib, forCellReuseIdentifier: "ProductViewCell")
        productsTableView.dataSource = self
        productsTableView.delegate = self
        getProducts()
        // Do any additional setup after loading the view.
    }
    
    func getProducts() {
        productsViewModel.getProducts {
            DispatchQueue.main.async {
                self.productsTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
        let data = productsViewModel.products[indexPath.row]
        cell.imageProductThumb.loadImage(url: data.thumbnail, cell: cell.imageProductThumb)
        cell.labelProductTitle.text = data.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = productsViewModel.products[indexPath.row]
        let productViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        productViewController.product = data
        self.navigationController?.pushViewController(productViewController, animated: true)
        }
}
