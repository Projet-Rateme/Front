//
//  HomeView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 20/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var postService = PostService()
    @ObservedObject var userService = UserService()
    
    var body: some View {
            NavigationView {
                TabView {
                    List {
                        VStack(alignment: .leading) {
                            VStack {
                                ScrollView(.horizontal,showsIndicators: false) {
                                    HStack {
                                        CurrentUserStoryView()
                                        ForEach(userService.items,id: \._id) { item in
                                            UsersStoryView(item: item)
                                        }
                                    }
                                }
                                Divider()
                                ForEach(postService.items,id: \._id) { item in
                                    PostCell(item: item)
                                    Divider()
                                }
                                
                            }.onAppear(perform: {
                                postService.fetchPosts()
                                userService.fetchUsers()
                            })
                            .padding(.leading, -15)
                            .padding(.trailing, -15)
                        }
                        
                    }.listStyle(GroupedListStyle())
                        .padding(.top, 70)
                        .edgesIgnoringSafeArea(.top)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    
                    Text("Bookmark Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "bookmark.circle.fill")
                            Text("Reels")
                        }
                    
                    Text("Video Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "video.circle.fill")
                            Text("Photos")
                        }
                    
                    Text("Profile Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Profile")
                        }
                }.navigationBarTitle("RateMe", displayMode: .inline)
                    .navigationBarItems(leading: Image("Camera"), trailing: Image("Direct"))
                
            }
    }
}

struct CurrentUserStoryView: View {
    @AppStorage("name") private var name = ""
    var body: some View {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image("AvatarBig")
                    Image("Add")
                }
                Text(name)
                    .scaledToFill()
                    .font(Font.system(size: 12.5))
                    .padding(.top, 4)
                }.padding(.trailing, 12)
    }
}

struct UsersStoryView : View {
    var item: User
    var body: some View {
        VStack {
            ZStack {
                Image("Border")
                Image("AvatarBig1")
            }
            Text(item.name)
                .scaledToFill()
                .font(Font.system(size: 12.5))
            }.padding(.trailing, 12)
    }
    
}

struct PostCell: View {
    
    @State private var postliked = [Post]()
    @State private var postlikes = [User]()
    @ObservedObject var postService = PostService()
    var item: Post
    @State var liked : Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("AvatarBig1")
                VStack(alignment: .leading) {
                    Text(item.user.name)
                        .font(Font.system(size: 13.5))
                    Text("Tunis, Tunisia")
                        .font(Font.system(size: 13.5))
                }
                Spacer()
                Image("More")
            }
            
            // Post
            AsyncImage(url: URL(string: item.image))
                .scaledToFit()
                .padding(.leading, -20)
                .padding(.trailing, -20)
                .onTapGesture(count: 2) {
                    liked.toggle()
                    postService.likePost(post: item._id)
                    postService.fetchPostLikes(post: item._id)
                    
                }.onAppear(perform: {
                    liked = item.liked
                    postService.fetchPostLikes(post: item._id)
                })
            
            // Horizontal bar
            HStack(alignment: .center){
                Image(liked ? "Heart" : "Like")
                    .renderingMode(.template)
                    .foregroundColor(liked ? .red : .black)
                    .onTapGesture {
                        postService.fetchPostLikes(post: item._id)
                    }
                Image("Comment")
                Image("Send")
                Spacer()
                Image("Collect")
            }
            
            Text("Liked By \(postService.likes.count) people")
                .font(Font.system(size: 13.5))
            
            Text(item.content)
                .lineLimit(4)
                .font(Font.system(size: 13))
                .foregroundColor(.init(white: 0.1))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
