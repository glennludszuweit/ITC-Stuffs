//
//  DetailsViewController.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 07/04/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    var fruit: Fruit?

    @IBOutlet weak var labelFruitFamily: UILabel!
    @IBOutlet weak var labelFruitName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fruit = fruit else { return }
        self.labelFruitName.text = fruit.name
        self.labelFruitFamily.text = "Family: \(fruit.family)"
    }
}
