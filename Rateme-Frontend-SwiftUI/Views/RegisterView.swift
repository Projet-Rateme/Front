//
//  RegisterView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 22/11/2022.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var userService = UserService()
    @Binding var name: String
    @Binding var email: String
    @Binding var password: String
    @Binding var cPassword: String
    @State var login_email = ""
    @State var login_password = ""
    @State var message = ""
    
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
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                            .foregroundColor(Color("PrimaryColor"))
                        Text(message)
                            .foregroundColor(Color.red)
                            .padding(.vertical)
                            .padding()
                            .frame(maxWidth: .infinity)
                        
                        TextField("Name", text: $name)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
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
                        TextField("Confirm password", text: $cPassword)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        
                        Spacer()
                        
                        Button(action: {
                            if (name != "" && email != "" && password != "" && cPassword != "") {
                                if (password == cPassword) {
                                    let parameters : [String: Any] = ["name": name, "email": email, "password": password, "confirmPassword": cPassword]
                                    userService.register(parameters: parameters)
                                    self.message = "An email was sent to \(email)"
                                } else {
                                    self.message = "Passwords do not match"
                                }
                            } else {
                                self.message = "All fields are required"
                            }
                        }) {
                            Text("Sign up")
                                .font(.title3)
                                .foregroundColor(Color("PrimaryColor"))
                                .fontWeight(.bold)
                                
                        }.frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                        NavigationLink(
                            destination: LoginView(email: $login_email, password: $login_password).navigationBarHidden(true),
                            label: {
                                Text("Back to login")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("PrimaryColor"))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(60.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                    .padding(.vertical)
                            })
                            .navigationBarHidden(true)
                        
                    }
                    
                    
                }
                .padding()
            }
        }
    }

//struct RegisterView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    RegisterView()
    //}
//}
