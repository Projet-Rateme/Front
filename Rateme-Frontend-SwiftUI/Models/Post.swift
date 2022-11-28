//
//  Post.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 21/11/2022.
//

import SwiftUI

struct Post: Decodable {
    let _id: String
    let title: String
    let content: String
    let image: String
    let user: User
    var liked: Bool
    var likes: [String]
}
