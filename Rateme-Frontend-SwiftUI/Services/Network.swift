//
//  Network.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/12/2022.
//

import Foundation

struct Network {
    
    static let BASE_URL = "http://localhost:3000"
    
    // MARK : AUTH Routes
    
    static let LoginURL = BASE_URL + "/login"
    static let LogoutURL = BASE_URL + "/logout"
    static let currentUserURL = BASE_URL + "/current"
    static let RegisterURL = BASE_URL + "/register"
    static let SendEmail = BASE_URL + "/sendemail"
    static let VerifyEmail = BASE_URL + "/verifyemail"
    static let forgotPasswordURL = BASE_URL + "/forgotpassword"
    static let verifyForgotPasswordCodeURL = BASE_URL + "/verifyresetpasswordcode"
    static let resetPasswordURL = BASE_URL + "/resetpassword"
    
    // MARK : POST Routes
    
    static let fetchPostsURL = BASE_URL + "/posts"
    static let fetchMyProfilePostsURL = BASE_URL + "/myprofileposts"
    static let postActionsURL = BASE_URL + "/post"
}
