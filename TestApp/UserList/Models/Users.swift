//
//  Users.swift
//  TestApp
//
//  Created by shaiju on 08/01/24.
//

import Foundation
import UIKit


struct Users: Codable {
    let bank : Bank?
    let ip : String?
    let weight : Double?
    let bloodGroup : String?
    let company : Company?
    let image : String?
    let birthDate : String?
    let hair : Hair?
    let maidenName : String?
    let eyeColor : String?
    let domain : String?
    let id : Int?
    let gender : String?
    let userAgent : String?
    let email : String?
    let phone : String?
    let height : Int?
    let firstName : String?
    let university : String?
    let age : Int?
    let macAddress : String?
    let ein : String?
    let password : String?
    let ssn : String?
    let lastName : String?
    let address : Address?
    let username : String?
    
    
    var uiImage: ((_ image : UIImage) -> Void)? {
        didSet {
            self.loadImage()
        }
    }
    
    enum CodingKeys: String, CodingKey {

        case bank = "bank"
        case ip = "ip"
        case weight = "weight"
        case bloodGroup = "bloodGroup"
        case company = "company"
        case image = "image"
        case birthDate = "birthDate"
        case hair = "hair"
        case maidenName = "maidenName"
        case eyeColor = "eyeColor"
        case domain = "domain"
        case id = "id"
        case gender = "gender"
        case userAgent = "userAgent"
        case email = "email"
        case phone = "phone"
        case height = "height"
        case firstName = "firstName"
        case university = "university"
        case age = "age"
        case macAddress = "macAddress"
        case ein = "ein"
        case password = "password"
        case ssn = "ssn"
        case lastName = "lastName"
        case address = "address"
        case username = "username"
    }
    
 
    func loadImage() {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: image ?? "") else {return}
            guard let imageData = try? Data(contentsOf: url) else {return}
            let image = UIImage(data: imageData) ?? UIImage()
            DispatchQueue.main.async {
                uiImage?(image)
            }
        }
    }

}

extension Users: Equatable {
    static func == (lhs: Users, rhs: Users) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
extension Users: Identifiable {
    
}

