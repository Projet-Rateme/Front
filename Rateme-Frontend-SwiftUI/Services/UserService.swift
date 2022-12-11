//
//  UserService.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 10/12/2022.
//

import Foundation
import SwiftUI
import Alamofire

class UserService: ObservableObject {
    @Published var items = [User]()
    
    @Published var message = ""
    
    @Published var isAuthenticated: Bool = false
    
    let urlPrefix = "http://127.0.0.1:3000"
    
    func register(parameters : [String: Any]) {
        guard let url = URL(string: "\(urlPrefix)/register") else {
            print ("URL not found")
            return
        }
        
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
                    let result = try JSONDecoder().decode(UserModel.self, from: data)
                    DispatchQueue.main.async {
                        self.message = result.message
                    }
                } else {
                    print ("No data")
                }
            } catch {
                print(String(describing: error))
            }
            
        }.resume()
    }

    
    func forgotPassword(parameters : [String: Any]) {
        guard let url = URL(string: "\(urlPrefix)/forgotpassword") else {
            print ("URL not found")
            return
        }
        
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
                    let result = try JSONDecoder().decode(UserModel.self, from: data)
                    self.message = result.message
                    DispatchQueue.main.async {
                        print(self.message)
                    }
                } else {
                    print ("No data")
                }
            } catch {
                print(String(describing: error))
            }
            
        }.resume()
    }
    
    func fetchUsers() {
        guard let url = URL(string: "\(urlPrefix)/getusers") else {
            print("URL not fouind")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(UserModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("fetch json error:", JsonError.localizedDescription)
            }
            
        }.resume()
    }
}
