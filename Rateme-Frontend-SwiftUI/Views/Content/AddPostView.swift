//
//  AddPostView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 10/12/2022.
//

import SwiftUI

struct AddPostView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea(.all)
            
            VStack {
                PostCaptionSection()
                Divider()
                PostSettingsSection()
                Spacer()
            }
        }.navigationBarItems(
            leading:
                HStack {
                    Button(action : {
                        self.mode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color("TextColor"))
                    }
                    Text("Create post")
                        .font(Font.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.leading, 7)
                        .foregroundColor(Color("TextColor"))
                }
        )
        .navigationBarBackButtonHidden(true)
        //.toolbar(.hidden, for: .tabBar)
        .toolbarBackground(
            Color("bgColor"),
            for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct PostCaptionSection: View {
    var body: some View {
        HStack {
            Image("pic")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width / 4.5)
                .padding(.leading, 10)
            Text("Post Caption")
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PostSettingsSection: View {
    @AppStorage("likesHidden") private var likesHidden = false
    var body: some View {
        VStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Tag People")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.cornerRadius(8)
                .padding(.bottom, 10)
            
            Divider()
            
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Add location")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }
            .padding(.bottom, 10)
        }
        
        Divider()
        
        Text("Likes and views")
            .fontWeight(.bold)
            .font(Font.system(size: 20))
            .foregroundColor(Color("TextColor"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
        VStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Toggle("Hide like count on this post", isOn: $likesHidden)
                        .padding(.leading, 15)
                        .padding(.trailing, 20)
                        .foregroundColor(Color("TextColor"))
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.padding(.bottom, 10)
        }
        
        Divider()
        
        Text("Comments")
            .fontWeight(.bold)
            .font(Font.system(size: 20))
            .foregroundColor(Color("TextColor"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
        VStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Toggle("Turn off commenting", isOn: $likesHidden)
                        .padding(.leading, 15)
                        .padding(.trailing, 20)
                        .foregroundColor(Color("TextColor"))
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.padding(.bottom, 10)
        }
        
        Divider()
        
        Text("Preferences")
            .fontWeight(.bold)
            .font(Font.system(size: 20))
            .foregroundColor(Color("TextColor"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
        VStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Toggle("Audience", isOn: $likesHidden)
                        .padding(.leading, 15)
                        .padding(.trailing, 20)
                        .foregroundColor(Color("TextColor"))
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.padding(.bottom, 10)
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddPostView()
            
            AddPostView().environment(\.colorScheme, .dark)
        }
    }
}
