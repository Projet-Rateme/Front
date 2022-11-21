//
//  HomeViewModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 20/11/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var users: [HomeViewModel] = []
    
    func getProfile() {
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        WebService().getAllAccounts(token: token) { result in
            switch result {
            case .success(let accounts):
                DispatchQueue.main.async {
                    self.accounts = accounts.map(AccountViewModel.init)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

struct AccountViewModel {
    let account: Account
    
    let id = UUID()
    
    var name: String {
        return account.name
    }

    var balance: Double {
        return account.balance
    }
}
