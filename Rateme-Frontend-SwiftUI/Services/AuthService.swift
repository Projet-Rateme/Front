//
//  AuthService.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/11/2022.
//

import Foundation
import SwiftUI

class AuthService: ObservableObject {
    @Published var items = Login(_id: "", name: "", email: "", password: "")
    
    @Published var message = ""
    
    @Published var isAuthenticated: Bool = false
    
    let urlPrefix = "http://127.0.0.1:3000"
    
    func login(parameters : [String: Any]) {
        guard let url = URL(string: "\(urlPrefix)/login") else {
            print ("URL not found")
            return
        }
        let defaults = UserDefaults.standard
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(LoginModel.self, from: data)
                    defaults.setValue(result.token, forKey: "jsonwebtoken")
                    defaults.setValue(result.data.name, forKey: "name")
                    DispatchQueue.main.async {
                        print(result)
                        self.isAuthenticated = true
                    }
                } else {
                    print ("No data")
                }
            } catch {
                print(String(describing: error))
            }
            
        }.resume()
    }
}
