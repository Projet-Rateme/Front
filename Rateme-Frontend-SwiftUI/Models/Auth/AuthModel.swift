//
//  AuthModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/12/2022.
//

import Foundation

enum AuthError : Error {
    case custom(errorMessage: String)
}

struct LoginRequestBody : Codable {
    let email, password: String
}

struct LoginResponse : Codable {
    let statusCode : Int
    let token: String?
    let message: String
    let user : User?
}

struct RegisterRequestBody : Codable {
    let firstname, lastname, password, confirmPassword, email : String
}

struct RegisterResponse : Codable {
    let statusCode : Int
    let message : String
    let user : User?
}

struct forgotPasswordRequestBody : Codable {
    let email : String
}

struct forgotPasswordResponse : Codable {
    let statusCode: Int
    let message : String
    let token : String?
}

struct forgotPasswordCodeRequestBody : Codable {
    let code : String
}

struct forgotPasswordCodeResponse : Codable {
    let statusCode : Int
    let message : String
    let token : String?
}

struct resetPasswordRequestBody : Codable {
    let password, confirmPassword : String
}

struct resetPasswordResponse : Codable {
    let statusCode: Int
    let message : String
}

struct sendEmailRequestBody : Codable {
    let email : String
}

struct sendEmailResponse : Codable {
    let statusCode : Int
    let token : String?
    let message : String
}

struct codeVerificationRequestBody : Codable {
    let code : String
}

struct codeVerificationResponse : Codable {
    let statusCode: Int
    let message : String
}




