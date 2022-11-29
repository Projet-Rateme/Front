//
//  ForgotPasswordView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 28/11/2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var userService = UserService()
    @Binding var email: String
    
    @State var message = ""
    
        var body: some View {
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Rate Me")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryColor"))
                    Spacer()
                    
                    VStack {
                        Text("Reset your password")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                            .foregroundColor(Color("PrimaryColor"))
                        Text(message)
                            .foregroundColor(Color.red)
                            .padding(.vertical)
                            .padding()
                            .frame(maxWidth: .infinity)
                    
                        TextField("Email Address", text: $email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        
                        Spacer()
                        
                        Button(action: {
                            if (email != "") {
                                let parameters : [String: Any] = ["email": email]
                                userService.forgotPassword(parameters: parameters)
                                self.message = "Password reset email was sent to \(email)"
                            } else {
                                self.message = "All fields are required"
                            }
                        }) {
                            Text("Send email")
                                .font(.title3)
                                .foregroundColor(.white)
                                
                        }.frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("PrimaryColor"))
                            .cornerRadius(50)
                        
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
