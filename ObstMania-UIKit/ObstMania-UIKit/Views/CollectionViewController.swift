//
//  CollectionViewController.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 07/04/2023.
//

import UIKit

class CollectionViewController: UIViewController {
    var fruitData = [Fruit]()
    let fruitController = NetworkServices()
    
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
        
        cell.delegate = self
        cell.fruit = data
        cell.labelFruitName.text = data.name
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier:  "DetailsViewController") as! DetailsViewController
        let data = fruitData[indexPath.item]
        detailsViewController.fruit = data
//        disable cell selection
        collectionView.allowsSelection = false
//        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension CollectionViewController: DelegateData {
    func didReceive(_ data: [Fruit]) {
        self.fruitData = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}

extension CollectionViewController: DetailsViewDelegate {
    func delegateData(data: Fruit) {
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.fruit = data
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
