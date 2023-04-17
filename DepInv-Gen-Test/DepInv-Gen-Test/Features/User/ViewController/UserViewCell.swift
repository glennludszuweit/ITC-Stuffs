//
//  UserTableViewCell.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import UIKit

class UserViewCell: UITableViewCell {
    
    @IBOutlet weak var labelWebsite: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
