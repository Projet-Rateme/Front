//
//  RegisterView.swift
//  Rateme-frontend
//
//  Created by Chawki Ferroukhi on 2/12/2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var eye = false
    @State private var confirm = false
    @State var mail = ""
    @State var pass = ""
    @State var repass = ""
       
    var body : some View{
        
        VStack{
            VStack{
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(Color("TextColor"))
                        .frame(width: 15, height: 18)
                    TextField("Email Address", text: self.$mail)
                    
                    if mail != "" {
                        Image(systemName: "checkmark").foregroundColor(.green)
                    }
                    else{
                        Image(systemName: "xmark").foregroundColor(.red)
                    }
                    
                }.padding(.vertical, 20)
                    .frame(maxHeight: UIScreen.main.bounds.height / 15)
                
                Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(Color("TextColor"))
                    
                    
                    if eye {
                        TextField("Password", text: self.$pass)
                            .foregroundColor(Color("TextColor"))
                        
                    }
                    else{
                        SecureField("Password", text: self.$pass)
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
                
                Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(Color("TextColor"))
                    
                    
                    if confirm {
                        TextField("Confirm Password", text: self.$pass)
                            .foregroundColor(Color("TextColor"))
                        
                    }
                    else{
                        SecureField("Confirm Password", text: self.$repass)
                            .foregroundColor(Color("TextColor"))
                    }
                    
                    Button(action: {
                        self.confirm.toggle()
                    })
                    {
                        Image(systemName: "eye").foregroundColor(Color("TextColor"))
                    }
                    
                }.padding(.vertical, 20)
                    .frame(maxHeight: UIScreen.main.bounds.height / 15)
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding(.top, 25)
            
            Button(action: {
                
            }) {
                
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                
            }.background(
                Color("PrimaryColor")
            )
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
            
            
            if pass != repass{
                Text("Please make sure your passwords match")
                    .font(.callout)
                    .foregroundColor(Color.red)
            }
            
        }.frame(maxWidth: UIScreen.main.bounds.width - 10)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
