//
//  NutritionViewController.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 12/04/2023.
//

import UIKit

class NutritionViewController: UIViewController {
    var nutrition: Nutritions?
    
    @IBOutlet weak var labelCalories: UILabel!
    @IBOutlet weak var labelFat: UILabel!
    @IBOutlet weak var labelSugar: UILabel!
    @IBOutlet weak var labelCarbohydrates: UILabel!
    @IBOutlet weak var labelProtien: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCalories.text = "Calories: \(nutrition?.calories ?? 0)"
        labelFat.text = "Fat: \(nutrition?.fat ?? 0)"
        labelSugar.text = "Sugar: \(nutrition?.sugar ?? 0)"
        labelCarbohydrates.text = "Carbohydrates: \(nutrition?.carbohydrates ?? 0)"
        labelProtien.text = "Protien: \(nutrition?.protein ?? 0)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
