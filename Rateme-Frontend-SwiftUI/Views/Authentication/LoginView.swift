//
//  LoginView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var eye = false
    @EnvironmentObject var authService : AuthService
    @Binding var email: String
    @Binding var password: String
        
    var body : some View{
        
        VStack{
            VStack{
                Text(authService.message)
                    .font(.callout)
                    .foregroundColor(Color.red)
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(Color("TextColor"))
                        .frame(width: 15, height: 18)
                    TextField("Email Address", text: self.$email)
                    
                    if email != "" {
                        Image(systemName: "checkmark").foregroundColor(.green)
                    }
                    else{
                        Image(systemName: "xmark").foregroundColor(.red)
                    }
                    
                    
                    
                }.padding(.vertical, 25)
                    .frame(maxHeight: UIScreen.main.bounds.height / 15)
                
                
                Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(Color("TextColor"))
                    
                    
                    if eye {
                        TextField("Password", text: self.$password)
                            .foregroundColor(Color("TextColor"))
                        
                    }
                    else{
                        SecureField("Password", text: self.$password)
                            .foregroundColor(Color("TextColor"))
                        
                    }
                    
                    Button(action: {
                        self.eye.toggle()
                    })
                    {
                        
                        Image(systemName: "eye").foregroundColor(Color("TextColor"))
                    }
                    
                    
                    
                }.padding(.vertical, 20)
                    .frame(maxHeight: UIScreen.main.bounds.height / 15)
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding(.top, 25)
            
            Button(action: {
                if (email != "" && password != "") {
                    let parameters : [String: Any] = ["email": email, "password": password]
                    authService.login(parameters: parameters)
                }
            }) {
                
                Text("SIGNIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                
            }.background(Color("PrimaryColor"))
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }.frame(maxWidth: UIScreen.main.bounds.width - 10, maxHeight: UIScreen.main.bounds.height / 2)
    }
}

/*struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}*/