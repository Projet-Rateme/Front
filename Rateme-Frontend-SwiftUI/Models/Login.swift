//
//  Login.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 28/11/2022.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [Login]
}
struct Login: Decodable {
    let _id: Int
    let name: String
    let email: String
    let password: String
}
