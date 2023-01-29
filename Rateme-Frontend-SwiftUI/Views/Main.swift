//
//  App.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI
import LocalAuthentication

struct Main: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var Auth : AuthViewModel
    @ObservedObject var postViewModel = PostViewModel()
        
    var body: some View {
        if !UserDefaults.standard.bool(forKey: "isAuthenticated"){
            switch viewRouter.currentPage {
            case .onBoardingView:
                OnboardingView()
            case .loginView:
                LoginView()
            case .registerView:
                RegisterView()
            case .mainView:
                HomeView()
            }
        } else {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack {
                    switch viewRouter.currentMainPage {
                    case .feedView:
                        FeedView(postViewModel: postViewModel)
                    case .discoverView:
                        FeedView(postViewModel: postViewModel)
                    case .newPostView:
                        ProfileView(postViewModel: postViewModel)
                    case .profileView:
                        ProfileView(postViewModel: postViewModel)
                    case .notificationsView:
                        FeedView(postViewModel: postViewModel)
                    }
                    ZStack {
                        HStack {
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .feedView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "homekit", tabName: "Home")
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .discoverView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "heart", tabName: "Discover")
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .newPostView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "plus", tabName: "Add")
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .notificationsView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "bell", tabName: "Notifications")
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .profileView, width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/40, systemIconName: "person.crop.circle", tabName: "Profile")
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/9)
                        .background(Color("TextFieldColor").shadow(radius: 3))
                    }
                }
                    .edgesIgnoringSafeArea(.bottom)
            }.onAppear(perform: {
                testFunction()
                postViewModel.fetchPosts()
                postViewModel.fetchMyProfilePosts()
                print(postViewModel.posts)
                print(postViewModel.profilePosts)
            })
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main().environmentObject(ViewRouter())
    }
}

func testFunction() {
    let context = LAContext()

    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Logging in with Face ID") { success, error in
            if success {
                print("face ID matches")
                UserDefaults.standard.set(true, forKey: "isAuthenticated")
            } else {
                print("face id doesn't match")
                UserDefaults.standard.set(false, forKey: "isAuthenticated")
            }
        }
    } else {
        print("device has no face ID")
    }
}
