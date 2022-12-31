//
//  FeedView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var Post = PostViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                ScrollView {
                    ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                            Text("All")
                                .foregroundColor(Color(.white))
                                .fontWeight(.semibold)
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 15)
                                .background(Color("PrimaryColor"))
                                .cornerRadius(15)
                            Text("Profiles")
                                .foregroundColor(Color("TextColor"))
                                .fontWeight(.semibold)
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 15)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("PrimaryColor"), lineWidth: 2))
                            Text("Photos")
                                .foregroundColor(Color("TextColor"))
                                .fontWeight(.semibold)
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 15)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("PrimaryColor"), lineWidth: 2))
                            Text("Videos")
                                .foregroundColor(Color("TextColor"))
                                .fontWeight(.semibold)
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 15)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("PrimaryColor"), lineWidth: 2))
                            Text("Funny")
                                .foregroundColor(Color("TextColor"))
                                .fontWeight(.semibold)
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 15)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("PrimaryColor"), lineWidth: 2))
                    }.padding()
                            
                    }
                    LazyVStack {
                        ForEach(Post.posts,id: \._id) { item in
                            PostCell(name: item.user.firstname, profilePicture: "https://thispersondoesnotexist.com/image", imageUrl: item.image, text: item.content)
                        }
                    }
                    
                }
            }.toolbar {
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
//                        self.presentationMode.wrappedValue.dismiss()
                        Post.fetchPosts()
                        print(Post.posts.count)
                        
                    })
                    {
                        HStack {
                            Image(systemName: "person")
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                }
            }.refreshable {
                Post.fetchPosts()
            }
        }.onAppear(perform: {
            Post.fetchPosts()
            print(Post.posts.count)
    })
    }
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//        FeedView().colorScheme(.dark)
//    }
//}
