//
//  CommentModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 2/1/2023.
//

import Foundation

struct Comment : Codable {
    var _id: String
    var content: String
    var user : User
    var likes : [User]
    var replies : [Comment]
}

struct CreateCommentRequestBody : Codable {
    let content: String
}

struct CreateCommentResponse : Codable {
    let statusCode : Int
    let message : String
    let comment : Comment
}
