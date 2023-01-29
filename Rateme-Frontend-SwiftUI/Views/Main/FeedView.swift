//
//  FeedView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var postViewModel : PostViewModel
    @EnvironmentObject var Auth : AuthViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                ScrollView {
                    LazyVStack {
                        ForEach(postViewModel.posts,id: \._id) { item in
                            PostCell(post: item, postViewModel: postViewModel, likes: item.likes)
                        }
                    }
                    
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {})
                    {
                        HStack {
                            Text("Good morning, Chawki")
                                .font(Font.system(size: 18))
                                .fontWeight(.semibold)
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button (action: {
                        Auth.logout()
                        Auth.alert = true
                        Auth.isLoading = true
                    })
                    {
                        HStack {
                            Image(systemName: "person")
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                }
            }.refreshable {
                postViewModel.fetchPosts()
            }
        }
        .blur(radius: Auth.alert ? 2 : 0)
            .customAlert(isPresented: $Auth.alert, hasIndicator: $Auth.isLoading, title: "Logging out", placeholder: "Placeholder")
    }
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//        FeedView().colorScheme(.dark)
//    }
//}
