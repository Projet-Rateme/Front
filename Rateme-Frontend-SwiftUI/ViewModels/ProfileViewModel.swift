//
//  ProfileViewModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 20/11/2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var users: [profileViewModel] = []
    
    func get() {
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        Auth().getUsers(token: token) { result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users.map(profileViewModel.init)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

struct profileViewModel {
    let user: User
    
    var id: String {
        return user._id
    }
    
    var name: String {
        return user.name
    }
    
    var email: String {
        return user.email
    }
}
