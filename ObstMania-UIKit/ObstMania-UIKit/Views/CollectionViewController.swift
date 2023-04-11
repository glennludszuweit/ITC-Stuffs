//
//  CollectionViewController.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 07/04/2023.
//

import UIKit

class CollectionViewController: UIViewController, DelegateData {
    var fruitData = [Fruit]()
    let fruitController = FruitService()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let cellXib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(cellXib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        fruitController.delegate = self
        fruitController.getFruitByDelegate()
    }
    
    func didReceive(_ data: [Fruit]) {
        self.fruitData = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
    
    @IBAction func switchToList(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let data = fruitData[indexPath.item]
        cell.labelFruitName.text = data.name
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier:  "DetailsViewController") as! DetailsViewController
        let data = fruitData[indexPath.item]
        detailsViewController.fruit = data
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
