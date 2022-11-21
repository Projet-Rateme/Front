//
//  WelcomeView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 19/11/2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
                    ZStack {
                        Color("BgColor").edgesIgnoringSafeArea(.all)
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
                            PrimaryButton(title: "Get Started")
                            
                            NavigationLink(
                                destination: LoginView().navigationBarHidden(true),
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
                                Text("Sign in")
                                    .foregroundColor(Color("PrimaryColor"))
                            }
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
