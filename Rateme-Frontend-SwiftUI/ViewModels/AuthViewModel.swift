//
//  AuthViewModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/12/2022.
//

import Foundation
import SwiftUI

class AuthViewModel : ObservableObject {
    
    // MARK : Register fields
    var register_firstname = ""
    var register_lastname = ""
    var register_email = ""
    var register_confirmPassword = ""
    var register_password = ""
    var registration_code = ""
    
    // MARK : Login fields
    var login_email = ""
    var login_password = ""
    
    // MARK : resetPassword fields
    var reset_code = ""
    var reset_email = ""
    var reset_password = ""
    var reset_confirmPassword = ""
    var message = ""
    
    
    @Published var currentUser : User?
    @Published var isAuthenticated : Bool = false
    @Published var isLoading = false
    @Published var alert = false
    @Published var readyToNavigate = false
    @Published var nextPage = false
    @Published var accessToken = ""
    @Published var resetToken = ""
    @Published var navigateToHome = false
    @Published var navigateToForgotPasswordStep3 = false
    @Published var navigateToForgotPasswordStep4 = false
    @EnvironmentObject var viewRouter : ViewRouter
    
    init () {
        if let data = UserDefaults.standard.data(forKey: "currentUser") {
            do {
                let currentUser = try JSONDecoder().decode(User.self, from: data)
                self.currentUser = currentUser
            } catch {
                print(error)
            }
        }
    }
    
//    func getCurrentUser() {
//        AuthService().getCurrentUser() { result in
//            switch result {
//            case.success(let data):
//                DispatchQueue.main.async() {
//                    if (data?.statusCode == 200) {
//                        self.currentUser = data?.user!
//                    }
//                    self.isLoading = false
//                    self.message = data?.message ?? ""
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//                self.alert = false
//            }
//        }
//    }
    func login(){
        AuthService().login(body: LoginRequestBody(email: login_email, password: login_password)){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    if data?.statusCode == 200 {
                        self.isAuthenticated = true
                        self.alert = false
                        self.isLoading = false
                        UserDefaults.standard.set(data?.token, forKey: "token")
                        if data?.token == UserDefaults.standard.string(forKey: "token") {
                            UserDefaults.standard.set(self.isAuthenticated, forKey: "isAuthenticated")
                            do {
                                let data = try JSONEncoder().encode(data?.user!)
                                UserDefaults.standard.set(data, forKey: "currentUser")
                            } catch {
                                print(error)
                            }
                            
                            if let data = UserDefaults.standard.data(forKey: "currentUser") {
                                do {
                                    let currentUser = try JSONDecoder().decode(User.self, from: data)
                                    self.currentUser = currentUser
                                    print(self.currentUser!)
                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }
                    self.message = data?.message ?? ""
                    self.alert = false
                    self.isLoading = false
                }
                
            case.failure(let error):
                print(error.localizedDescription)
                self.alert = false
                self.isLoading = false
            }
        }
    }
    
    func sendEmail() {
        AuthService().sendEmail(body: sendEmailRequestBody(email: register_email)) { result in
            switch result {
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.readyToNavigate.toggle()
                        self.accessToken = data?.token ?? ""
                    }
                    self.isLoading = false
                    self.message = data?.message ?? ""
                    
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
    func verifyEmail() {
        AuthService().verifyEmail(token: self.accessToken, body: codeVerificationRequestBody(code: registration_code)) { result in
            switch result {
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if (data?.statusCode == 200) {
                        self.isLoading = false
                        self.nextPage = true
                    } else {
                        self.isLoading = false
                        self.message = data?.message ?? ""
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
    func register() {
        AuthService().register(body: RegisterRequestBody(firstname: register_firstname, lastname: register_lastname, password: register_password, confirmPassword: register_confirmPassword, email: register_email)) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if (data?.statusCode == 200) {
                        self.isLoading = false
                        self.alert = false
                        self.message = data?.message ?? ""
                        self.navigateToHome = true
                    }
                    self.isLoading = false
                    self.alert = false
                    self.message = data?.message ?? ""
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.alert = false
                self.isLoading = false
            }
        }
    }
    
    func forgotPassword() {
        AuthService().forgotPassword(body: forgotPasswordRequestBody(email: reset_email)) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.resetToken = data?.token ?? ""
                        self.navigateToForgotPasswordStep3 = true
                    }
                    
                    self.isLoading = false
                    self.message = data?.message ?? ""
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
    func verifyCode() {
        AuthService().verifyForgotPasswordCode(token: self.resetToken, body: forgotPasswordCodeRequestBody(code: reset_code)) { result in
            switch result {
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if (data?.statusCode == 200) {
                        self.isLoading = false
                        self.navigateToForgotPasswordStep4 = true
                    }
                    self.isLoading = false
                    self.message = data?.message ?? ""
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.alert = false
            }
        }
    }
    
    func resetPassword() {
        AuthService().resetPassword(token: self.resetToken, body: resetPasswordRequestBody(password: reset_password, confirmPassword: reset_confirmPassword)) { result in
            switch result {
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if (data?.statusCode == 200) {
                        self.isLoading = false
                    }
                    self.alert = false
                    self.isLoading = false
                    self.message = data?.message ?? ""
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.alert = false
            }
        }
    }
    
    func logout(){
        AuthService().logout(){ result in
            switch result {
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    if data?.statusCode == 200 {
                        self.isAuthenticated = false
                        self.alert = false
                        self.isLoading = false
                        UserDefaults.standard.set(nil, forKey: "currentUser")
                        UserDefaults.standard.set(self.isAuthenticated, forKey: "isAuthenticated")
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
