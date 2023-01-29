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
    var likes : [String]
    var comments : [Comment]
}

struct fetchPostCommentsResponse : Codable {
    let statusCode : Int
    let message : String
    let post : Post
}

struct likePostResponse : Decodable {
    let message : String
    let statusCode : Int
    let data : Post
}

struct fetchPostsResponse : Decodable {
    let posts : [Post]
    let message : String
    let statusCode : Int
}
