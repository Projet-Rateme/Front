//
//  HomeView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 20/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var userdata = [User]()
    @State private var postdata = [Post]()
    
    var body: some View {
            NavigationView {
                TabView {
                    List {
                        VStack(alignment: .leading) {
                            VStack {
                                ScrollView(.horizontal,showsIndicators: false) {
                                    HStack {
                                        ForEach(userdata,id: \._id) { user in
                                            StoriesView(user: user)
                                        }
                                    }
                                }
                                Divider()
                                ForEach(postdata,id: \._id) { post in
                                    PostCell(post: post)
                                    Divider()
                                }
                                
                            }
                            .padding(.leading, -12)
                        }
                    }.onAppear{
                        getUsers()
                        getPosts()
                        
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
                            Text("Bookmark")
                        }
                    
                    Text("Video Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "video.circle.fill")
                            Text("Video")
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

struct StoriesView: View {
    let user: User
    var body: some View {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image("AvatarBig")
                    Image("Add")
                }
                Text(user.name)
                    .font(Font.system(size: 13.5))
                }.padding(.trailing, 12)
    }
}

struct PostCell: View {
    
    @State private var postliked = [Post]()
    var post: Post
    @State var liked : Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("AvatarBig1")
                VStack(alignment: .leading) {
                    Text(post.user.name)
                        .font(Font.system(size: 13.5))
                    Text("Tunis, Tunisia")
                        .font(Font.system(size: 13.5))
                }
                Spacer()
                Image("More")
            }
            
            // Post
            Image("Photo")
                .resizable()
                .scaledToFit()
                .padding(.leading, -20)
                .padding(.trailing, -20)
                .onTapGesture(count: 2) {
                    likePost(post: post._id)
                    liked.toggle()
                    print(liked)
                }.onAppear{
                    liked = post.liked
                }
            
            // Horizontal bar
            HStack(alignment: .center){
                Image(liked ? "Heart" : "Like")
                    .renderingMode(.template)
                    .foregroundColor(liked ? .red : .black)
                Image("Comment")
                Image("Send")
                Spacer()
                Image("Collect")
            }
            
            Text("test")
                .font(Font.system(size: 13.5))
            
            Text(post.content)
                .lineLimit(4)
                .font(Font.system(size: 13))
                .foregroundColor(.init(white: 0.1))
        }
    }
}

extension PostCell {
    
    func likePost(post: String){
        
        guard let url = URL(string: "http://127.0.0.1:3000/\(post)/like") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
                    DispatchQueue.main.async {
                        self.postliked = decodedResponse
                    }
                }
            }
        }.resume()
        
        
        
        
    }
    
}

extension HomeView {
    func getUsers() {
        guard let url = URL(string: "http://127.0.0.1:3000/getusers") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.userdata = decodedResponse
                    }
                }
            }
        }.resume()
    }
    
    func getPosts() {
        guard let url = URL(string: "http://127.0.0.1:3000/posts") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
                    DispatchQueue.main.async {
                        self.postdata = decodedResponse
                    }
                }
            }
        }.resume()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
