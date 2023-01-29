//
//  AuthService.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/12/2022.
//

import Foundation
import Alamofire

struct AuthService {
    
    static let shared = AuthService()
    
    var token = UserDefaults.standard.string(forKey: "token")
    
    func login(body: LoginRequestBody, completion: @escaping(Result<LoginResponse?, AuthError>) -> Void) {
        AF.request("\(Network.LoginURL)",
                   method: .post,
                   parameters: [
                    "email": body.email,
                    "password": body.password],
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(LoginResponse.self, from: responseData)
                    completion(.success(parsedData))
                    UserDefaults.standard.set(parsedData.token, forKey: "token")
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func getCurrentUser(completion: @escaping(Result<LoginResponse?, AuthError>) -> Void) {
        AF.request("\(Network.currentUserURL)",
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: HTTPHeaders([
                    "Authorization": "\(UserDefaults.standard.string(forKey: "token") ?? "")",
                ]))
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(LoginResponse.self, from: responseData)
                    completion(.success(parsedData))
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func sendEmail(body: sendEmailRequestBody, completion: @escaping(Result<sendEmailResponse?, AuthError>) -> Void) {
        AF.request("\(Network.SendEmail)",
                   method: .post,
                   parameters: ["email": body.email],
                   encoding: JSONEncoding.default
                   )
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(sendEmailResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
        
    }
    
    func verifyEmail(token: String, body: codeVerificationRequestBody, completion: @escaping(Result<codeVerificationResponse?, AuthError>) -> Void) {
        AF.request("\(Network.VerifyEmail)/\(token)",
                   method: .post,
                   parameters: ["code": body.code],
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(codeVerificationResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
        
    }
    
    func register(body: RegisterRequestBody, completion: @escaping(Result<RegisterResponse?, AuthError>) -> Void) {
        AF.request("\(Network.RegisterURL)",
                   method: .post,
                   parameters: [
                    "firstname": body.firstname,
                    "lastname": body.lastname,
                    "password": body.password,
                    "confirmPassword": body.confirmPassword,
                    "email": body.email],
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(RegisterResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func forgotPassword(body: forgotPasswordRequestBody, completion: @escaping(Result<forgotPasswordResponse?, AuthError>) -> Void) {
        AF.request("\(Network.forgotPasswordURL)",
                   method: .post,
                   parameters: ["email": body.email],
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(forgotPasswordResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func verifyForgotPasswordCode(token: String, body: forgotPasswordCodeRequestBody, completion: @escaping(Result<forgotPasswordCodeResponse?, AuthError>) -> Void) {
        AF.request("\(Network.verifyForgotPasswordCodeURL)/\(token)",
                   method: .post,
                   parameters: ["code": body.code],
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(forgotPasswordCodeResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func resetPassword(token: String, body: resetPasswordRequestBody, completion: @escaping(Result<resetPasswordResponse?, AuthError>) -> Void) {
        AF.request("\(Network.resetPasswordURL)/\(token)",
                   method: .put,
                   parameters: [
                    "password": body.password,
                    "confirmPassword": body.confirmPassword],
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(resetPasswordResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
        
    }
    
    func logout(completion: @escaping(Result<LoginResponse?, AuthError>) -> Void) {
        AF.request("\(Network.LogoutURL)",
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: HTTPHeaders([
                    "Authorization": "\(UserDefaults.standard.string(forKey: "token") ?? "")",
                ]))
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                do {
                    let parsedData = try JSONDecoder().decode(LoginResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }

}
