//
//  ProfileView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var postViewModel : PostViewModel
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    ProfileHeaderView().ignoresSafeArea(.all).environmentObject(AuthViewModel())
                    ProfileTabBarView()
                    ProfilePostsView(postViewModel: postViewModel)
                    Spacer()
                }
            }.refreshable {
                postViewModel.fetchMyProfilePosts()
            }
        }
    }
}
