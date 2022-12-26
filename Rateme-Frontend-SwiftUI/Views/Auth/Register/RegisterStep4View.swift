//
//  RegisterStep4View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct RegisterStep4View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var firstname = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack(spacing: 30) {
                    AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/75191392?v=4")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    .clipShape(Circle())
                    TextField("Firstname", text: $firstname)
                        .textFieldStyle(CustomTextField(icon: "person"))
                    TextField("Lastname", text: $firstname)
                        .textFieldStyle(CustomTextField(icon: "person"))
                    TextField("Email Address", text: $firstname)
                        .textFieldStyle(CustomTextField(icon: "person"))
                    TextField("Date of birth", text: $firstname)
                        .textFieldStyle(CustomTextField(icon: "person"))
                    TextField("Phone Number", text: $firstname)
                        .textFieldStyle(CustomTextField(icon: "phone"))
                    Button(action: {
                        withAnimation {
                            viewRouter.currentPage = .loginView
                            viewRouter.currentLoginPage = .loginPage2
                        }
                    }, label: {})
                        .buttonStyle(CustomButton(text: "Sign up", isPrimary: true, color: "PrimaryColor"))
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            viewRouter.currentRegisterPage = .registerPage3
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Profile Information")
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct RegisterStep4View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterStep4View()
            RegisterStep4View().colorScheme(.dark)
        }
    }
}
