//
//  UserModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/12/2022.
//

import Foundation

struct User : Codable {
    var _id : String
    var firstname : String
    var lastname : String
    var email : String
    var password : String
    var isVerified: Bool
}
