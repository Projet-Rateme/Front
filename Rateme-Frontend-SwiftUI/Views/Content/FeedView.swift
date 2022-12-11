//
//  FeedView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var authService: AuthService
    @ObservedObject var postService = PostService()
    @ObservedObject var userService = UserService()
    var body: some View {
        NavigationView {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack {
                            Text("Trending")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 5)
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack {
                                    CurrentUserStoryView(item: authService.currentUser)
                                    ForEach(userService.items,id: \._id) { item in
                                        UsersStoryView(item: item)
                                    }
                                }.padding(.bottom, 20)
                            }
                        }.padding(5)
                        
                        Divider()
                            .padding(.leading, 25)
                            .padding(.trailing, 25)
                        
                        ForEach(postService.items,id: \._id) { item in
                            PostCell(item: item).padding(.top, 10)
                        }
                    }.onAppear(perform: {
                        postService.fetchPosts()
                        userService.fetchUsers()
                    })
                }
            }.navigationBarItems(leading:Text("RateMe")
                .font(Font.system(size: 20))
                .fontWeight(.bold)
                .padding(.leading, -10)
                .foregroundColor(Color("TextColor")), trailing: Image("Direct").renderingMode(.template).foregroundColor(Color("TextColor")))
            .toolbarBackground(
                Color("bgColor"),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct CurrentUserStoryView: View {
    var item: Auth
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("Photo")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 5.3)
                    .blur(radius: 1)
                VStack {
                    Image("Add")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 30, height: 30)
                        .padding(.top, -37)
                    Text(item.name)
                        .font(Font.system(size: 10))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 15)
                .background(Color.black.opacity(0.6))
                
            }.cornerRadius(20)
        }.padding(.trailing, 12)
    }
}

struct UsersStoryView: View {
    var item: User
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 5.3)
                    .blur(radius: 2)
                VStack {
                    AsyncImage(url: URL(string: item.image)) { image in
                        image
                            .resizable()
                    } placeholder: {
                        //put your placeer here
                    }
                        
                        .cornerRadius(20)
                        .frame(width: 30, height: 30)
                        .padding(.top, -37)
                    Text(item.name)
                        .font(Font.system(size: 10))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 15)
                .background(Color.black.opacity(0.6))
                
            }.cornerRadius(20)
        }.padding(.trailing, 12)
    }
}

struct PostCell: View {
    @ObservedObject var postService = PostService()
    var item: Post
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: item.user.image)){ image in
                    image
                        .resizable()
                        // Error here
                } placeholder: {
                    //put your placeholder here
                }
                    .frame(width: 55.0, height: 55.0)
                    .cornerRadius(27.5)
                VStack(alignment: .leading) {
                    Text(item.user.name)
                        .font(Font.system(size: 13.5))
                        .fontWeight(.bold)
                    Text("Tunis, Tunisia")
                        .font(Font.system(size: 13.5))
                }
                Spacer()
                Image("More")
                    .renderingMode(.template)
                    .foregroundColor(Color("TextColor"))
                    .padding(.trailing, 10)
            }.padding(.leading, 10)
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: item.image)) { image in
                    image
                        .resizable()
                        // Error here
                } placeholder: {
                    //put your placeholder here
                }
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height / 3.5)
                
                HStack {
                    Image("Like")
                        .renderingMode(.template)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)
                    Text("798")
                        .foregroundColor(Color.white)
                    Image("Comment")
                        .renderingMode(.template)
                        .padding(.leading, 10)
                        .foregroundColor(Color.white)
                    Text("40")
                        .foregroundColor(Color.white)
                    Spacer()
                    Image("Collect")
                        .renderingMode(.template)
                        .foregroundColor(Color.white)
                        .padding(.trailing)
                }
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height / 16)
                .background(Color.black.opacity(0.4))
            }
            
            Text("Comments here")
                .lineLimit(4)
                .font(Font.system(size: 13))
                .foregroundColor(Color("TextColor"))
                .padding(.leading, 5)
            
        
        }.frame(maxWidth: UIScreen.main.bounds.width)
        
        Divider()
    
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeedView()
            
            FeedView()
                .environment(\.colorScheme, .dark)
        }
    }
}
