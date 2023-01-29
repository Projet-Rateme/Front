//
//  TabBar.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            //            VStack {
            //                switch viewRouter.currentMainPage {
            //                case .feedView:
            //                    FeedView()
            //                case .discoverView:
            //                    FeedView()
            //                case .newPostView:
            //                    ProfileView()
            //                case .profileView:
            //                    ProfileView()
            //                case .notificationsView:
            //                    FeedView()
            //                }
            ZStack {
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .feedView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "homekit", tabName: "Home")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .discoverView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "heart", tabName: "Discover")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .newPostView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "plus", tabName: "Add")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .notificationsView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "bell", tabName: "Notifications")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .profileView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "person.crop.circle", tabName: "Profile")
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/9)
                .background(Color("TextFieldColor").shadow(radius: 1))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: AppViews
    
    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                withAnimation {
                    viewRouter.currentMainPage = assignedPage
                }
            }
            .foregroundColor(viewRouter.currentMainPage == assignedPage ? Color("TextColor") : .gray)
    }
}
