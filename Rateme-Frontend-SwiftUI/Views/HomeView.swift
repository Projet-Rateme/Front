//
//  HomeView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 20/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var userdata = [User]()
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Stories")
                        Spacer()
                        Image("Watch")
                        Text("Watch all")
                    }.padding(.leading, -12)
                    
                    VStack {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(userdata,id: \._id) { user in
                                    StoriesView(user: user)
                                }
                            }
                        }
                        Divider()
                        ForEach(userdata,id: \._id) { user in
                            PostCell(user: user)
                            Divider()
                        }
                        
                    }
                    .padding(.leading, -12)
                }
            }.onAppear(perform: getUsers)
                .listStyle(GroupedListStyle())
                .navigationBarTitle("RateMe", displayMode: .inline)
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
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("AvatarBig1")
                VStack(alignment: .leading) {
                    Text(user.email)
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
            
            // Horizontal bar
            HStack(alignment: .center){
                Image("Like")
                Image("Comment")
                Image("Send")
                Spacer()
                Image("Collect")
            }
            
            Text("Liked by Chawki and 543 others")
                .font(Font.system(size: 13.5))
            
            Text("Ti le aad")
                .lineLimit(4)
                .font(Font.system(size: 13))
                .foregroundColor(.init(white: 0.1))
        }
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
