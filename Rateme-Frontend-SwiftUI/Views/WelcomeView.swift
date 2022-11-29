//
//  WelcomeView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var register_email = ""
    @State var register_password = ""
    @State var name = ""
    @State var cPassword = ""
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        NavigationView {
                    ZStack {
                        Color("PrimaryColor").edgesIgnoringSafeArea(.all)
                        VStack {
                            Spacer()
                            Image(uiImage: #imageLiteral(resourceName: "onboard"))
                            Spacer()
                            VStack {
                                Text("Rate People &")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Be Social")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }.padding()
                            
                            NavigationLink(
                                destination: LoginView(email: $email, password: $password).navigationBarHidden(true),
                                label: {
                                    Text("Sign In")
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
                            
                            HStack {
                                Text("New around here? ")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                NavigationLink(
                                    destination: RegisterView(name: $name, email: $register_email, password: $register_password, cPassword: $cPassword).navigationBarHidden(true),
                                    label: {
                                        Text("Sign up")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("PrimaryColor"))
                                    })
                                    .navigationBarHidden(true)
                                        
                            }.frame(maxWidth: .infinity)
                        }
                        .padding()
                        
                    }
                }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
