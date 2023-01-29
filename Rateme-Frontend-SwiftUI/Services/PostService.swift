//
//  PostService.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import Foundation
import Alamofire
import SwiftUI

struct PostService {
    
    static let shared = PostService()
    
    var token = UserDefaults.standard.string(forKey: "token")
    
    func fetchPosts(completion: @escaping(Result<fetchPostsResponse?, AuthError>) -> Void) {
        AF.request("\(Network.fetchPostsURL)",
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
                    let parsedData = try JSONDecoder().decode(fetchPostsResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func fetchMyProfilePosts(completion: @escaping(Result<fetchPostsResponse?, AuthError>) -> Void) {
        AF.request("\(Network.fetchMyProfilePostsURL)",
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
                    let parsedData = try JSONDecoder().decode(fetchPostsResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func likePost(postId: String,  completion: @escaping(Result<likePostResponse?, AuthError>) -> Void) {
        AF.request("\(Network.postActionsURL)/\(postId)/like",
                   method: .post,
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
                    let parsedData = try JSONDecoder().decode(likePostResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
        
    }
    
    func fetchPostLikes(postId: String, completion: @escaping(Result<fetchPostCommentsResponse?, AuthError>) -> Void) {
        AF.request("\(Network.postActionsURL)/\(postId)/likes",
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
                    let parsedData = try JSONDecoder().decode(fetchPostCommentsResponse.self, from: responseData)
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
