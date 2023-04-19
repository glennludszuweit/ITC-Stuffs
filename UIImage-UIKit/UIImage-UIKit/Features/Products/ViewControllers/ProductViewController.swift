//
//  ProductViewController.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

class ProductViewController: UIViewController {
    var product: Product!

    @IBOutlet weak var labelBrand: UILabel!
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelBrand.text = product.brand
        labelModel.text = product.title
        labelDescription.text = product.description
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
