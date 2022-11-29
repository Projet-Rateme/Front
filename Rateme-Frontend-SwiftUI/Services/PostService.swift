//
//  PostService.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 28/11/2022.
//

import Foundation
import SwiftUI

class PostService: ObservableObject {
    @Published var items = [Post]()
    
    @Published var likes = [User]()
    
    @Published var message = ""
    
    let urlPrefix = "http://127.0.0.1:3000"
    
    func fetchPosts() {
        guard let url = URL(string: "\(urlPrefix)/posts") else {
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
                    let result = try JSONDecoder().decode(PostModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(String(describing: error))
            }
            
        }.resume()
    }
    
    func likePost(post: String) {
        
        guard let url = URL(string: "\(urlPrefix)/\(post)/like") else {
            print("URL not found")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(PostModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(String(describing: error))
            }
            
        }.resume()
        
    }
    
    func fetchPostLikes(post: String) {
        guard let url = URL(string: "\(urlPrefix)/post/\(post)/likes") else {
            print("URL not found")
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
                        self.likes = result.data
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(String(describing: error))
            }
            
            
        }.resume()
    }
    
}
