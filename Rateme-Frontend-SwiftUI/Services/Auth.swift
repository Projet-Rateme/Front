//
//  Auth.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import Foundation

enum AuthenticationError : Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case decodingError
    case noData
    case invalidURL
}

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

struct RegisterRequestBody : Codable {
    let email: String
    let password: String
    let fullName: String
    let confirm_password: String
}

struct loginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

struct registerResponse: Codable {
    let message: String?
    let success: Bool?
}

class Auth {
    
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> ()) {
        
            guard let url = URL(string: "http://127.0.0.1:3000/login") else {
                completion(.failure(.custom(errorMessage: "URL is not correct")))
                return
            }
            
            let body = LoginRequestBody(email: email, password: password)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            URLSession.shared.dataTask(with: request) { data, response, error  in
                
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
                
            guard let loginResponse = try? JSONDecoder().decode(loginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
                        
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
                        
            completion(.success(token))
        }.resume()
    }

    
    func getUsers(token: String, completion: @escaping (Result<Array<User>, NetworkError>) -> ()) {
            guard let url = URL(string: "http://127.0.0.1:3000/getUsers") else {
                completion(.failure(.invalidURL))
                return
            }
            
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data = data, error == nil else {
                    completion(.failure(.noData))
                    return
                }
                
                guard let decodedResponse = try? JSONDecoder().decode([User].self, from: data) else {
                    completion(.failure(.decodingError))
                    return
                }
                 
                completion(.success(decodedResponse))
                
            }.resume()
        }
}
