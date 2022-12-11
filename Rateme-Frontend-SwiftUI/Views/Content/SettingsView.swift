//
//  SettingsView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    HeaderSectionView()
                    Divider()
                    SettingsAndPrivacySectionView()
                }
            }
        }.navigationBarItems(
            leading:
                HStack {
                    Button(action : {
                        self.mode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color("TextColor"))
                    }
                    Text("Settings")
                        .font(Font.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.leading, 7)
                        .foregroundColor(Color("TextColor"))
                }
        )
        .navigationBarBackButtonHidden(true)
        //.toolbar(.hidden, for: .tabBar)
        .toolbarBackground(
            Color("bgColor"),
            for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct HeaderSectionView: View {
    var body: some View {
            HStack {
                Image("pic")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width / 7)
                    .clipShape(Circle())
                VStack {
                    Text("Chawkiii___")
                        .fontWeight(.bold)
                        .font(Font.system(size: 14))
                        .padding(.leading, -30)
                    Text("See your profile")
                        .foregroundColor(Color.gray)
                        .padding(.leading, 5)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 10)
        Spacer()
    }
}

struct SettingsAndPrivacySectionView: View {
    @EnvironmentObject var authService : AuthService
    var body: some View {
        Text("Account Settings")
            .fontWeight(.bold)
            .font(Font.system(size: 25))
            .foregroundColor(Color("TextColor"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
        Text("Update your info to keep your account secure")
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
        VStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Personal and account information")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Password and security")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Payments")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
        }
        
        Text("Prefrences")
            .fontWeight(.bold)
            .font(Font.system(size: 25))
            .foregroundColor(Color("TextColor"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
        Text("Customize your experience on RateMe")
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
        VStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Notifications")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Language and region")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            
            NavigationLink(destination: DisplayModeView()) {
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(Color("TextColor2"))
                            .frame(maxWidth: UIScreen.main.bounds.width - 400)
                            .fontWeight(.bold)
                            .font(Font.system(size: 20))
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        Text("Display mode")
                            .foregroundColor(Color("TextColor2"))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Your time on Rateme")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
        }
            
            Text("Help & Support")
                .fontWeight(.bold)
                .font(Font.system(size: 25))
                .foregroundColor(Color("TextColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            Text("Here we can help you")
                .foregroundColor(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
        VStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Help center")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Report a problem")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Safety")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
            
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(Color("TextColor2"))
                        .frame(maxWidth: UIScreen.main.bounds.width - 400)
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text("Terms and policies")
                        .foregroundColor(Color("TextColor2"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width - 10)
                
            }.background(Color("ButtonColor"))
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.bottom, 20)
        }
        
        Button (action: {
            authService.logout()
        }) {
            HStack {
                Text("Logout")
                    .foregroundColor(Color("TextColor2"))
                    .padding(.vertical)
            }.frame(width: UIScreen.main.bounds.width - 10)
        }.background(Color("ButtonColor"))
            .cornerRadius(8)
            .shadow(radius: 5)
            .padding(.top, 20)
//        NavigationLink(destination: HomeView()) {
//            HStack {
//                Text("Logout")
//                    .foregroundColor(Color("TextColor2"))
//                    .padding(.vertical)
//            }.frame(width: UIScreen.main.bounds.width - 10)
//            
//        }.background(Color("ButtonColor"))
//            .cornerRadius(8)
//            .shadow(radius: 5)
//            .padding(.top, 20)
//            .onTapGesture {
//                authService.logout()
//            }
        
        
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
            
            SettingsView().environment(\.colorScheme, .dark)
        }
    }
}
