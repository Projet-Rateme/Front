//
//  User.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

struct UserModel: Decodable {
    let error: Bool
    let message: String
    let data: [User]
}
struct User: Decodable {
    let _id: String
    let name: String
    let email: String
    let password: String
}
