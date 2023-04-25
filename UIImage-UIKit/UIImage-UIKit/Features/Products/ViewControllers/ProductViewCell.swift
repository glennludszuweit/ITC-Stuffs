//
//  ProductViewCell.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

class ProductViewCell: UITableViewCell {
    @IBOutlet weak var imageProductThumb: UIImageView!
    @IBOutlet weak var labelProductTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
