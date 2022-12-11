//
//  HomeView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var index = 0
    @State var register_email = ""
    @State var register_password = ""
    @State var register_name = ""
    @State var register_cpassword = ""
    @State var email = ""
    @State var password = ""
    
    var body : some View{
        NavigationView {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea(.all)
                VStack{
                    VStack {
                        HStack(alignment: .center) {
                            Text("Sign")
                                .font(Font.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(Color("logoColor"))
                            Text(self.index == 0 ? "In" : "Up")
                                .font(Font.system(size: 30))
                                .foregroundColor(Color("logoColor"))
                        }.frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(.bottom, 5)
                        
                        Text(self.index == 0 ? "Log in to your account" : "Sign up to create your account")
                            .font(Font.system(size: 20))
                            .foregroundColor(Color("TextColor"))
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                    }.padding(.leading, 30)
                    
                        .padding(.top, 30)
                    LogoView()
                    
                    
                    HStack{
                        Button(action: {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                                self.index = 0
                            }
                            
                        }) {
                            ZStack{
                                Text("SIGNIN")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 10)
                                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                                    .overlay( self.index == 0 ? RoundedRectangle(cornerRadius: 25.0).stroke(Color("PrimaryColor"), lineWidth: 4) : RoundedRectangle(cornerRadius: 25.0).stroke(Color.clear, lineWidth: 4) )
                            }
                            
                        }.background(self.index == 0 ? Color("PrimaryColor") : Color.clear)
                            .clipShape(Capsule())
                        
                        
                        Button(action: {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                                self.index = 1
                            }
                            
                        }) {
                            
                            Text("SIGNUP")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                                .overlay( self.index == 0 ? RoundedRectangle(cornerRadius: 25.0).stroke(Color.clear, lineWidth: 4) : RoundedRectangle(cornerRadius: 25.0).stroke(Color("PrimaryColor"), lineWidth: 4) )
                            
                        }.background(self.index == 1 ? Color("PrimaryColor") : Color.clear)
                            .clipShape(Capsule())
                        
                    }.background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .padding(.top, 25)
                    
                    if self.index == 0{
                        LoginView(email: $email, password: $password)
                    }
                    else{
                        RegisterView(name: $register_name, email: $register_email, password: $register_password, cPassword: $register_cpassword)
                    }
                    
                    if self.index == 0{
                        Button(action: {
                        }) {
                            Text("Forget Password?")
                                .foregroundColor(.blue)
                        }
                        .padding(.top, 20)
                    }
                    
                    
                    HStack {
                        Color("TextColor").opacity(0.5)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 1)
                        Text("Or")
                            .fontWeight(.bold)
                            .foregroundColor(Color("TextColor"))
                        
                        Color("TextColor").opacity(0.5)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 1)
                        
                    }
                    .padding(.top, 10)
                    
                    Text(self.index == 0 ? "Sign in using" : "Sign up using")
                        .font(Font.system(size: 15))
                        .foregroundColor(Color("TextColor"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 5)
                    
                    HStack{
                        //Button 1
                        Button(action: {
                        }) {
                            Image("gp")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .padding()
                        }.background(Color("SecondaryColor"))
                            .clipShape(Circle())
                            .shadow(color: .gray, radius: 2, x: 0.0, y: 0.0)
                        
                        Spacer().frame(width: 20, height: 0, alignment: .center)
                        
                        //Button 2
                        Button(action: {
                        }) {
                            Image("google")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .padding()
                        }.background(Color("SecondaryColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: .gray, radius: 2, x: 0.0, y: 0.0)
                        
                        Spacer().frame(width: 20, height: 0, alignment: .center)
                        
                        //Button 3
                        Button(action: {
                        }) {
                            VStack{
                                Image(systemName: "plus")
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .padding()
                            }
                        }.background(Color("SecondaryColor"))
                            .clipShape(Circle())
                            .shadow(color: .gray, radius: 2, x: 0.0, y: 0.0)
                        
                    }.frame(width: UIScreen.main.bounds.width)
                        .padding(.top, -10)
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            
            HomeView()
                .environment(\.colorScheme, .dark)
        }
    }
}
