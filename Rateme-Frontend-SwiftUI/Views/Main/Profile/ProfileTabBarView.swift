//
//  ProfileTabBar.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 31/12/2022.
//

import SwiftUI

struct ProfileTabBarView: View {
    @EnvironmentObject var viewRouter : ViewRouter
    var body: some View {
        VStack {
            //                switch viewRouter.currentMainPage {
            //                case .feedView:
            //                    FeedView()
            //                        .transition(.move(edge: .trailing))
            //                case .discoverView:
            //                    FeedView()
            //                        .transition(.move(edge: .trailing))
            //                case .newPostView:
            //                    ProfileView()
            //                        .transition(.move(edge: .trailing))
            //                case .profileView:
            //                    ProfileView()
            //                        .transition(.move(edge: .trailing))
            //                case .notificationsView:
            //                    FeedView()
            //                        .transition(.move(edge: .trailing))
            //                }
            ZStack {
                HStack {
                    TabBarText(width: 10, height: 10, tabName: "Posts")
                    Spacer()
                    TabBarText(width: 10, height: 10, tabName: "Comments")
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/20)
                .background(Color("TextFieldColor"))
            }
        }
    }
}

struct ProfileTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabBarView()
    }
}

struct TabBarText: View {
    
//    @StateObject var viewRouter: ViewRouter
//    let assignedPage: AppViews
    
    let width, height: CGFloat
    let tabName: String

    var body: some View {
        VStack {
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                withAnimation {
                    //viewRouter.currentMainPage = assignedPage
                }
            }
            //.foregroundColor(viewRouter.currentMainPage == assignedPage ? Color("TextColor") : .gray)
            .border(Color.black, width: 1)
            .padding(.bottom, 1)
    }
}
