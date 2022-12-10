//
//  AppView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Text("Reels")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Reels")
                }
            Text("Reels")
                .tabItem {
                    Image(systemName: "camera")
                    Text("Reels")
                }
            Text("Reels")
                .tabItem {
                    Image(systemName: "person")
                    Text("Reels")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppView()
            
            AppView().environment(\.colorScheme, .dark)
        }
    }
}
