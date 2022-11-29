//
//  Post.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 21/11/2022.
//

import SwiftUI
import Foundation

struct PostModel: Decodable {
    let error: Bool
    let message: String
    let data: [Post]
}

struct Post: Decodable {
    let _id: String
    let title: String
    let content: String
    let image: String
    let user: User
    let liked: Bool
    let likes: [User]
}
