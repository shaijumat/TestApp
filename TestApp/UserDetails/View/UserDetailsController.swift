//
//  UserDetailsController.swift
//  TestApp
//
//  Created by shaiju on 10/01/24.
//

import UIKit

class UserDetailsController: UIViewController {

    /// Iboutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var bloodgroupLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyAdressLabel: UILabel!
    
    /// objects declartion
    var userDetail: Users?
   
    /// view controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    ///  function to show the basic user details
    private func populateData() {
        userImageView.loadUserImage(userImageUrl: userDetail?.image ?? "")
        nameLabel.text = "Name: \(userDetail?.firstName ?? "") \(userDetail?.lastName ?? "")"
        ageLabel.text = "Age: \(userDetail?.age ?? 0)"
        genderLabel.text = "Gender: \(userDetail?.gender ?? "")"
        dobLabel.text = "Date of Birth: \(formatDateString())"
        bloodgroupLabel.text = "Blood Group: \(userDetail?.bloodGroup ?? "")"
        emailLabel.text = "Email: \(userDetail?.email ?? "")"
        phoneLabel.text = "Phone: \(userDetail?.phone ?? "")"
        addressLabel.text = "Address: \(userDetail?.address?.address ?? ""), \(userDetail?.address?.city ?? ""), \(userDetail?.address?.postalCode ?? "") \(userDetail?.address?.state ?? "")"
        companyAdressLabel.text = "Company Address: \(userDetail?.company?.address?.address ?? ""), \(userDetail?.company?.address?.city ?? ""), \(userDetail?.company?.address?.postalCode ?? "")  \(userDetail?.company?.address?.state ?? "")"
    }
   
    
    /// function to format the date for a specific format
    /// - Returns: formatted date
    private func formatDateString() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        if let date = dateFormatterGet.date(from: userDetail?.birthDate ?? "") {
            return(dateFormatterPrint.string(from: date))
        } else {
            return ""
        }
    }
}
