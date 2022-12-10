//
//  ProfileView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        HeaderSection()
                        InformationSection()
                        ContentSection()
                    }
                }
                
            }
            .navigationBarItems(leading:Text("@Chawkiii___")
            .font(Font.system(size: 18))
            .fontWeight(.bold)
            .padding(.leading, 7)
            .foregroundColor(Color("TextColor")), trailing:
                                    HStack {
                NavigationLink(destination: AddPostView()) {Image(systemName: "plus").renderingMode(.template).foregroundColor(Color("TextColor"))}
                NavigationLink(destination: SettingsView()) {Image(systemName: "gear").renderingMode(.template).foregroundColor(Color("TextColor"))}
            })
            .toolbarBackground(
                Color("bgColor"),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct HeaderSection: View {
    var body: some View {
            Image("Photo")
                .resizable()
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height / 3.5)
                .cornerRadius(20)
                .padding(.top, -40)
            HStack {
                Image("pic")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width / 4)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.top, -65)
            }
    }
}

struct InformationSection: View {
    var body: some View {
        Text("Chawki Ferroukhi")
            .font(Font.system(size: 20))
            .fontWeight(.bold)
        Text("@Chawki___")
            .font(Font.system(size: 12))
            .padding(.top, 2)
        HStack {
            VStack {
                Text("Followers")
                Text("24.3k")
                    .fontWeight(.bold)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 40)
            VStack {
                Text("Following")
                Text("2k")
                    .fontWeight(.bold)
            }.frame(maxWidth: .infinity, alignment: .center)
            VStack {
                Text("Posts")
                Text("124")
                    .fontWeight(.bold)
            }.frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 40)
        }.padding(.top, 10)
    }
}

struct ContentSection: View {
    @State var index = 0
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                    self.index = 0
                }
            }) {
                ZStack {
                    Text("All")
                        .foregroundColor(self.index == 0 ? Color(.white) : Color("TextColor"))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 200) / 2)
                        .overlay( self.index == 0 ? RoundedRectangle(cornerRadius: 25).stroke(Color("PrimaryColor"), lineWidth: 4) : RoundedRectangle(cornerRadius: 25.0).stroke(Color.clear, lineWidth: 1))
                }
            }.background(self.index == 0 ? Color("PrimaryColor") : Color.clear).clipShape(Capsule())
            Button(action: {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                    self.index = 1
                }
            }) {
                ZStack {
                    Text("Photos")
                        .foregroundColor(self.index == 1 ? Color(.white) : Color("TextColor"))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 200) / 2)
                        .overlay( self.index == 1 ? RoundedRectangle(cornerRadius: 25).stroke(Color("PrimaryColor"), lineWidth: 4) : RoundedRectangle(cornerRadius: 25.0).stroke(Color.clear, lineWidth: 1))
                }
            }.background(self.index == 1 ? Color("PrimaryColor") : Color.clear).clipShape(Capsule())
            Button(action: {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                    self.index = 2
                }
            }) {
                ZStack {
                    Text("Videos")
                        .foregroundColor(self.index == 2 ? Color(.white) : Color("TextColor"))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 200) / 2)
                        .overlay( self.index == 2 ? RoundedRectangle(cornerRadius: 25).stroke(Color("PrimaryColor"), lineWidth: 4) : RoundedRectangle(cornerRadius: 25.0).stroke(Color.clear, lineWidth: 1))
                }
            }.background(self.index == 2 ? Color("PrimaryColor") : Color.clear).clipShape(Capsule())
            
        }.background(.ultraThinMaterial)
            .clipShape(Capsule())
            .padding(.top, 25)
        
        if self.index == 0{
            ProfilePostsView().padding(.top, 10)
        }
        else if self.index == 1 {
            ProfilePhotosView().padding(.top, 10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
            
            ProfileView()
                .environment(\.colorScheme, .dark)
        }
    }
}
