//
//  UserService.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 28/11/2022.
//

import Foundation
import SwiftUI

class UserService: ObservableObject {
    @Published var items = [Login]()
    
    @Published var message = ""
    
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
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    self.message = result.message
                    DispatchQueue.main.async {
                        print(result)
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
}
