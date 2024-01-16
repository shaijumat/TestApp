//
//  Address.swift
//  TestApp
//
//  Created by shaiju on 08/01/24.
//

import Foundation

struct Address: Codable {
    let coordinates : Coordinates?
    let postalCode : String?
    let state : String?
    let city : String?
    let address : String?

    
}
