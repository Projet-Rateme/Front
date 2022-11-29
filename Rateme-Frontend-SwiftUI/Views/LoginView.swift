//
//  LoginView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

struct LoginView: View {
    @State var forgotpassword_email = ""
    
    @ObservedObject var authService = AuthService()
    @Binding var email: String
    @Binding var password: String
    @State var register_email = ""
    @State var register_name = ""
    @State var register_password = ""
    @State var register_cpassword = ""
        var body: some View {
            ZStack {
                Color("PrimaryColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Rate Me")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryColor"))
                    Spacer()
                    
                    VStack {
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                            .foregroundColor(Color("PrimaryColor"))
                        
                        SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "apple")), text: Text("Sign in with Apple"))
                        
                        SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google"))
                            .padding(.vertical)
                        
                        Divider()
                            .frame(height: 1)
                            .overlay(.gray)
                            .padding(.top, 30)
                        
                        Text("Or login using email")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .foregroundColor(Color("PrimaryColor"))
                        
                        TextField("Email Address", text: $email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        TextField("Password", text: $password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        
                        HStack {
                            Text("Forgot Password?")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                            NavigationLink(
                                destination: ForgotPasswordView(email: $forgotpassword_email).navigationBarHidden(true),
                                label: {
                                    Text("Reset")
                                        .foregroundColor(Color("PrimaryColor"))
                                        .fontWeight(.bold)
                                })
                                .navigationBarHidden(true)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            if (email != "" && password != "") {
                                let parameters : [String: Any] = ["email": email, "password": password]
                                authService.login(parameters: parameters)
                                print(authService.isAuthenticated)
                            }
                        }) {
                            Text("Sign in")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color("PrimaryColor"))
                                
                        }.frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                        
                    }
                    
                    Spacer()
                    Spacer()
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                        NavigationLink(
                            destination: RegisterView(name: $register_name, email: $register_email, password: $register_password, cPassword: $register_cpassword).navigationBarHidden(true),
                            label: {
                                Text("Create an account")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .fontWeight(.bold)
                            })
                        .navigationBarHidden(true)
                        .padding(.leading)
                    }
                    
                }
                .padding()
            }.navigate(to: HomeView(), when: $authService.isAuthenticated)
        }
    }

struct SocialLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            Spacer()
            image
            text
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryColor"))
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
    }
}
