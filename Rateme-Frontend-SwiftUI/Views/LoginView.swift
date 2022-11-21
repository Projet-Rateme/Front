//
//  LoginView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
            loginHeading()
        }
    }

struct loginHeading: View {
    @State private var email: String = "" // by default it's empty
    
    @ObservedObject var loginVM = loginViewModel()
        var body: some View {
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Text(loginVM.isAuthenticated ? "logged in" : "logged off")
                    Spacer()
                    
                    VStack {
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                            .foregroundColor(.white)
                        
                        SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "apple")), text: Text("Sign in with Apple"))
                        
                        SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google"))
                            .padding(.vertical)
                        
                        Divider()
                            .frame(height: 1)
                            .overlay(.white)
                            .padding(.top, 30)
                        
                        Text("Or login using email")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .foregroundColor(.white)
                        
                        TextField("Email Adress", text: $loginVM.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        TextField("Password", text: $loginVM.password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        
                        Button(action: {
                            loginVM.login()
                            print($loginVM.isAuthenticated)
                        }) {
                            Text("Sign in")
                        }
                        
                    }
                    
                    Spacer()
                    Spacer()
                    Text("You are completely safe.")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Read our Terms & Conditions.")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    
                }
                .padding()
            }.navigate(to: HomeView(), when: $loginVM.isAuthenticated)
        }
    }

struct SocalLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            Spacer()
            image
            text
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
