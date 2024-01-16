//
//  UserListTableViewCell.swift
//  TestApp
//
//  Created by shaiju on 09/01/24.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    /// IBoutlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    /// returs the nib object
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    /// returns the reuse identifier for the cell
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    /// function used to display data in the tableviewcell
    /// - Parameter user: user object for each indexpath 
    public func setUserData(user: Users) {
        userNameLabel.text = "Name: \(user.firstName ?? "") \(user.lastName ?? "")"
        ageLabel.text = "Age: \(user.age ?? 0)"
        genderLabel.text = "Gender: \(user.gender ?? "")"
        emailLabel.text = "Email: \(user.email ?? "")"
        userImageView.loadUserImage(userImageUrl: user.image ?? "")
    }
}
