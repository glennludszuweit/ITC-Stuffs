//
//  UserViewCell.swift
//  Users-UIKit-MVVM
//
//  Created by Glenn Ludszuweit on 13/04/2023.
//

import UIKit

class UserViewCell: UITableViewCell {
    var user: User?
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserEmail: UILabel!
    @IBOutlet weak var labelUserWebsite: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func getUserDetails(_ sender: Any) {
    }
}
