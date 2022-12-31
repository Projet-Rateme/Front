//
//  PostViewModel.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import Foundation
import SwiftUI

class PostViewModel : ObservableObject {
    
    @EnvironmentObject var viewRouter : ViewRouter
    
    @Published var posts = [Post]()
    var isLoading = true
    var message = ""
    
    func fetchPosts(){
        
        PostService().fetchPosts(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
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
}
