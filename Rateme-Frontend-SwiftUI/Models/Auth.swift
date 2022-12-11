//
//  Auth.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 10/12/2022.
//

import Foundation
import SwiftUI

struct AuthModel: Codable {
    let error: Bool
    let message: String
    let token: String
    let data: Auth?
}
struct Auth: Codable {
    let _id: String
    let name: String
    let email: String
    let password: String
    let image: String
}
