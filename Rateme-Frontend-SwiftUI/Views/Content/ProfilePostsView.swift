//
//  ProfilePostsView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct ProfilePostsView: View {
    @ObservedObject var postService = PostService()
    let items = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    var body : some View{
        VStack {
            LazyVGrid(columns: items) {
                ForEach(postService.items,id: \._id) { item in
                    PostView(item: item)
                }.padding()
            }
        }.onAppear(perform: {
            postService.fetchCurrentUserPosts()
        })
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

struct PostView: View {
    var item: Post
    var body: some View {
        AsyncImage(url: URL(string: item.image)) { image in
            image
                .resizable()
        } placeholder: {
            //put your placeer here
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 3.5, maxHeight: UIScreen.main.bounds.height / 8)
        .cornerRadius(20)
    }
}

struct ProfilePostsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfilePostsView()
            
            ProfilePostsView()
                .environment(\.colorScheme, .dark)
        }
    }
}
