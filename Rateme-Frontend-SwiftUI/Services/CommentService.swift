//
//  CommentService.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 2/1/2023.
//

import Foundation
import Alamofire

struct CommentService {
    
    static let shared = CommentService()
    
    func createComment(postId: String,  body: CreateCommentRequestBody, completion: @escaping(Result<CreateCommentResponse?, AuthError>) -> Void) {
        AF.request("\(Network.postActionsURL)/\(postId)/comment",
                   method: .post,
                   parameters: [
                    "content": body.content],
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
                    let parsedData = try JSONDecoder().decode(CreateCommentResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
                } catch {print(error)}
                
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(.custom(errorMessage: err.localizedDescription)))
            }
        }
    }
    
    func fetchPostComments(postId: String, completion: @escaping(Result<fetchPostCommentsResponse?, AuthError>) -> Void) {
        AF.request("\(Network.postActionsURL)/\(postId)/comments",
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
