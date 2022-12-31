//
//  ProfilePostsView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 31/12/2022.
//

import SwiftUI

struct ProfilePostsView: View {
    @ObservedObject var Post = PostViewModel()
    var body: some View {
            LazyVStack {
                ForEach(Post.posts,id: \._id) { item in
                    PostCell(name: item.user.firstname, profilePicture: "https://thispersondoesnotexist.com/image", imageUrl: item.image, text: item.content)
                }
            }.onAppear(perform: {
            Post.fetchMyProfilePosts()
            print(Post.posts)
        })
    }
}

struct ProfilePostsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePostsView()
    }
}
