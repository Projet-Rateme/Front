//
//  RegisterView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 22/11/2022.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
            registerHeading()
        }
    }

struct registerHeading: View {
    @State private var email: String = "" // by default it's empty
    
    @ObservedObject var loginVM = loginViewModel()
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
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                            .foregroundColor(.white)
                        
                        TextField("FullName", text: $loginVM.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        TextField("Email Adresse", text: $loginVM.email)
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
                        
                        Spacer()
                        
                        Button(action: {
                            loginVM.login()
                            print($loginVM.isAuthenticated)
                        }) {
                            Text("Sign up")
                                .font(.title3)
                                .foregroundColor(.white)
                                
                        }.frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("PrimaryColor"))
                            .cornerRadius(50)
                        
                    }
                    
                    
                }
                .padding()
            }.navigate(to: HomeView(), when: $loginVM.isAuthenticated)
        }
    }

/*extension RegisterView {
    
    func register(email: String, password: String, fullName: String) {
        
        guard let url = URL(string: "http://127.0.0.1:3000/register") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.postliked = decodedResponse
                    }
                }
            }
        }.resume()
        
        
        
        
    }
    
}*/

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
