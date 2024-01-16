//
//  GetUsersApiResponse.swift
//  TestApp
//
//  Created by shaiju on 08/01/24.
//

import Foundation
import UIKit

struct GetUsersApiResponse: Codable {
    let total : Int?
    let users : [Users]?
    let skip : Int?
    let limit : Int?
}

