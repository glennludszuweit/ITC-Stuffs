//
//  TableViewCell.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 07/04/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    var fruit: Fruit?
    var passDetailsData: ((Fruit) -> Void)?
    
    @IBOutlet weak var labelFruitName: UILabel!
    @IBOutlet weak var buttonDetails: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization codes
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func goToDetailsView(_ sender: Any) {
        self.passDetailsData?(self.fruit!)
    }
}
