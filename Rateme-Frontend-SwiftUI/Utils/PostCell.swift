//
//  PostCell.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI
import ActivityIndicatorView

struct PostCell: View {
    @State var post : Post
    @StateObject var postViewModel : PostViewModel
    @EnvironmentObject var Auth : AuthViewModel
    @State var likes : [String]
    @State var readyToNavigate = false
    var body: some View {
        ZStack {
            Color("bgColor")
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    AsyncImage(url: URL(string: "https://thispersondoesnotexist.com/image")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .frame(width: UIScreen.main.bounds.width / 8)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 8)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(post.user.firstname)
                            .foregroundColor(Color("TextColor"))
                            .fontWeight(.medium)
                        Text("20m ago")
                            .foregroundColor(Color(.gray))
                            .fontWeight(.light)
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .padding(.trailing, 5)
                }.padding()
                
                Text(post.content)
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.light)
                    .font(Font.system(size: 18))
                    .padding(.leading, 20)
                
                AsyncImage(url: URL(string: post.image)) { image in image
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width / 8)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 1, maxHeight: UIScreen.main.bounds.height / 3.5)
                .onTapGesture(count: 2, perform: {
                    postViewModel.likePost(postId: post._id)
                    post.likes.forEach {
                        like in
                        if likes.contains(Auth.currentUser!._id) {
                            likes = likes.filter { $0 != Auth.currentUser!._id }
                        } else {
                            likes.append(Auth.currentUser!._id)
                        }
                    }
                })
                HStack {
                    if likes.contains(Auth.currentUser!._id) {
                        withAnimation(.easeIn) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color(.red))
                                .fontWeight(.light)
                                .transition(.opacity)
                        }
                    } else {
                        withAnimation(.easeIn){
                            Image(systemName: "heart")
                                .fontWeight(.light)
                                .transition(.opacity)
                        }
                    }
                    Text("\(likes.count)")
                        .font(Font.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Image(systemName: "message")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.light)
                        .onTapGesture {
                            postViewModel.navigateToComments = true
                        }
                    Text("\(post.comments.count)")
                        .font(Font.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Spacer()
                    Image(systemName: "bookmark")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.light)
                }.padding()
                
                Divider()
            }
        }.navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: self.$readyToNavigate) {
                CommentView(post: post, postViewModel: postViewModel)
            }
            .onTapGesture {
                self.readyToNavigate = true
            }
            .onAppear(perform: {
                postViewModel.fetchPostComments(post: post)
            })
    }
}
