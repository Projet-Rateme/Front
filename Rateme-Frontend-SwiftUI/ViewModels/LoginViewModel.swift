//
//  LoginViewModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import Foundation

class loginViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    var id: String = "637afde98674870317310399"
    @Published var isAuthenticated: Bool = false
    
    func login() {

        let defaults = UserDefaults.standard
        
        Auth().login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "jsonwebtoken")
                defaults.setValue(self.email, forKey: "email")
                defaults.setValue(self.id, forKey: "id")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jsonwebtoken")
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
    
}
