//
//  ProductViewController.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDataSource {
    var product: Product!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelBrand: UILabel!
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelBrand.text = product.brand
        labelModel.text = product.title
        labelDescription.text = product.description
        
        let cellXib = UINib(nibName: "ProductPhotoViewCell", bundle: nil)
        collectionView.register(cellXib, forCellWithReuseIdentifier: "ProductPhotoViewCell")
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductPhotoViewCell", for: indexPath) as! ProductPhotoViewCell
        let imageUrl = product.images[indexPath.row]
        cell.imageProduct.loadImage(url: imageUrl, cell: cell.imageProduct)
        return cell
    }
}
