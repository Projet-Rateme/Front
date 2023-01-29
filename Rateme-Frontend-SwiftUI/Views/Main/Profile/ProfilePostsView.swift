//
//  ProfilePostsView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 31/12/2022.
//

import SwiftUI

struct ProfilePostsView: View {
    @StateObject var postViewModel : PostViewModel
    var body: some View {
            LazyVStack {
                ForEach(postViewModel.profilePosts,id: \._id) { item in
                    PostCell(post: item, postViewModel: postViewModel, likes: item.likes)
                }
            }
    }
}
