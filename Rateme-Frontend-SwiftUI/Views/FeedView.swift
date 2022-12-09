//
//  FeedView.swift
//  Rateme-frontend
//
//  Created by Chawki Ferroukhi on 5/12/2022.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Trending")
                            .fontWeight(.bold)
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                CurrentUserStoryView()
                                UsersStoryView()
                            }.padding(.bottom, 20)
                        }
                        
                        Divider()
                            .padding(.leading, 25)
                            .padding(.trailing, 25)
                        
                        PostCell().padding(.top, 10)
                    }.padding()
                }
            }.navigationBarItems(leading:Text("RateMe")
                .font(Font.system(size: 20))
                .fontWeight(.bold)
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
                    Text("Current User")
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
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 5.3)
                    .blur(radius: 2)
                VStack {
                    Image("Photo2")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 30, height: 30)
                        .padding(.top, -37)
                    Text("User1")
                        .font(Font.system(size: 10))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 15)
                .background(Color.black.opacity(0.6))
                
            }.cornerRadius(20)
        }.padding(.trailing, 12)
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("Photo")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 5.3)
                    .blur(radius: 2)
                VStack {
                    Image("Photo2")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 30, height: 30)
                        .padding(.top, -37)
                    Text("User1")
                        .font(Font.system(size: 10))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 15)
                .background(Color.black.opacity(0.6))
                
            }.cornerRadius(20)
        }.padding(.trailing, 12)
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.9, maxHeight: UIScreen.main.bounds.height / 5.3)
                    .blur(radius: 2)
                VStack {
                    Image("Photo")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 30, height: 30)
                        .padding(.top, -37)
                    Text("User1")
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
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("pic")
                    .resizable()
                    .frame(width: 55.0, height: 55.0)
                    .cornerRadius(27.5)
                VStack(alignment: .leading) {
                    Text("Test")
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
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: UIScreen.main.bounds.height / 3.5)
                    .cornerRadius(20)
                
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
                .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: UIScreen.main.bounds.height / 16)
                .background(Color.black.opacity(0.4))
            }.cornerRadius(20)
            
            Text("Comments here")
                .lineLimit(4)
                .font(Font.system(size: 13))
                .foregroundColor(Color("TextColor"))
                .padding(.leading, 5)
            
        
        }.frame(maxWidth: UIScreen.main.bounds.width)
        
        Divider()
        
        VStack(alignment: .leading) {
            HStack {
                Image("pic")
                    .resizable()
                    .frame(width: 55.0, height: 55.0)
                    .cornerRadius(27.5)
                VStack(alignment: .leading) {
                    Text("Test")
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
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: UIScreen.main.bounds.height / 3.5)
                    .cornerRadius(20)
                
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
                .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: UIScreen.main.bounds.height / 16)
                .background(Color.black.opacity(0.4))
            }.cornerRadius(20)
            
            Text("Comments here")
                .lineLimit(4)
                .font(Font.system(size: 13))
                .foregroundColor(Color("TextColor"))
                .padding(.leading, 5)
            
        
        }.frame(maxWidth: UIScreen.main.bounds.width)
        
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
