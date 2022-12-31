//
//  ProfileView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var Post = PostViewModel()
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    ProfileHeaderView().ignoresSafeArea(.all)
                    ProfileTabBarView()
                    ProfilePostsView()
                    Spacer()
                }
            }.refreshable {
                Post.fetchMyProfilePosts()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
            ProfileView().colorScheme(.dark)
        }
    }
}
