//
//  CollectionViewCell.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 07/04/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var delegate: DetailsViewDelegate?
    var fruit: Fruit?
    
    @IBOutlet weak var labelFruitName: UILabel!
    @IBOutlet weak var buttonDetails: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func goToDetailsView(_ sender: Any) {
        delegate?.delegateData(data: self.fruit!)
    }
}
