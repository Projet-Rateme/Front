//
//  RegisterStep4View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct RegisterStep4View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var Auth : AuthViewModel
    @State var empty = true
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
                    Text(Auth.message)
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                    TextField("Firstname", text: $Auth.register_firstname)
                        .textFieldStyle(CustomTextField(icon: "person", text: $Auth.register_firstname))
                    TextField("Lastname", text: $Auth.register_lastname)
                        .textFieldStyle(CustomTextField(icon: "person", text: $Auth.register_lastname))
                    SecureField("Password", text: $Auth.register_password)
                        .textFieldStyle(CustomTextField(icon: "lock", text: $Auth.register_password))
                    SecureField("Confirm Password", text: $Auth.register_confirmPassword)
                        .textFieldStyle(CustomTextField(icon: "lock", text: $Auth.register_confirmPassword))
                    Button(action: {
                        Auth.isLoading = true
                        Auth.alert = true
                        Auth.register()
                        if Auth.navigateToHome {
                            viewRouter.currentPage = .loginView
                        }
                    }, label: {})
                        .buttonStyle(CustomButton(text: "Sign up", isPrimary: true, color: "PrimaryColor"))
                }
            }
            .navigationBarBackButtonHidden(true)
            .blur(radius: Auth.alert ? 2 : 0)
            .customAlert(isPresented: $Auth.alert, hasIndicator: $Auth.isLoading, title: "Account registration", placeholder: "Placeholder")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Profile information")
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
