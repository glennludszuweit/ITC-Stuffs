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
    
    @IBOutlet weak var labelUserEmailView: UILabel!
    @IBOutlet weak var labelUserNameView: UILabel!
    @IBOutlet weak var labelUserWebsiteView: UILabel!
    
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
