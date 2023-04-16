//
//  UserTableViewCell.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    var user: User?
    var passUserData: ((User) -> Void)?
    
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
    
    @IBAction func getUserDetails(_ sender: Any) {
        self.passUserData?(self.user!)
    }
}
