//
//  Network.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/12/2022.
//

import Foundation

struct Network {
    
    static let BASE_URL = "http://localhost:3000"
    
    static let LoginURL = BASE_URL + "/login"
    static let RegisterURL = BASE_URL + "/register"
    static let SendEmail = BASE_URL + "/sendemail"
    static let VerifyEmail = BASE_URL + "/verifyemail"
    static let forgotPasswordURL = BASE_URL + "/forgotpassword"
    static let verifyForgotPasswordCodeURL = BASE_URL + "/verifyresetpasswordcode"
    static let resetPasswordURL = BASE_URL + "/resetpassword"
}
