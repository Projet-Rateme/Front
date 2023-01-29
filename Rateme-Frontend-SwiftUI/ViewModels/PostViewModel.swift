//
//  PostViewModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import Foundation
import SwiftUI

class PostViewModel : ObservableObject {
    var comment_content = ""
    
    @Published var posts = [Post]()
    @Published var profilePosts = [Post]()
    @Published var comment = Comment(_id: "", content: "", user: User(_id: "", firstname: "", lastname: "", email: "", password: "", isVerified: false), likes: [], replies: [])
    @Published var comments = [Comment]()
    @Published var likes = [String]()
    @Published var navigateToComments = false
    
    var isLoading = true
    var message = ""
    
    func fetchPosts() {
        PostService().fetchPosts(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.posts = data?.posts ?? []
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchMyProfilePosts(){
        
        PostService().fetchMyProfilePosts(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.profilePosts = data?.posts ?? []
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func likePost(postId: String) {
        PostService().likePost(postId: postId){ result in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.likes = (data?.data.likes)!
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    func fetchPostLikes(post: Post) {
        PostService().fetchPostLikes(postId: post._id){ result in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.likes = (data?.post.likes)!
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func fetchPostComments(post: Post) {
        CommentService().fetchPostComments(postId: post._id){ result in
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.comments = (data?.post.comments)!
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func createComment(post: Post) {
        CommentService().createComment(postId: post._id, body: CreateCommentRequestBody(content: comment_content)){ result in
            switch result {
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.comments.append((data?.comment)!)
                    }
                }
                
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
