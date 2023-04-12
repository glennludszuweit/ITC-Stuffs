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
    @IBOutlet weak var labelFruitOrder: UILabel!
    @IBOutlet weak var labelFruitGenus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fruit = fruit else { return }
        self.labelFruitName.text = fruit.name
        self.labelFruitFamily.text = "Family: \(fruit.family)"
        self.labelFruitOrder.text = "Order: \(fruit.order)"
        self.labelFruitGenus.text = "Genus: \(fruit.genus)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewNutrition" {
            let nutritionViewController = segue.destination as? NutritionViewController
            nutritionViewController?.nutrition = self.fruit?.nutritions
        }
    }
}
