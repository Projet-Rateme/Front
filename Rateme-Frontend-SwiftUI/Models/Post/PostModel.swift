//
//  Post.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import Foundation

struct Post : Codable {
    var _id : String
    var content : String
    var image : String
    var user : User
    var likes : [User]
}

struct fetchPostsResponse : Decodable {
    let posts : [Post]
    let message : String
    let statusCode : Int
}
