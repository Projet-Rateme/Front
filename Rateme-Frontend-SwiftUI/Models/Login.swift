//
//  Login.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 28/11/2022.
//

import Foundation
import SwiftUI

struct LoginModel: Decodable {
    let error: Bool
    let message: String
    let token: String
    let data: Login
}
struct Login: Decodable {
    let _id: String
    let name: String
    let email: String
    let password: String
}
