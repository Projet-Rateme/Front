//
//  Stories.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import Foundation

struct Stories: Decodable {
    let id: String
    let user: [User]
    let content: String
    let type: String
    let createdAt: String
}
