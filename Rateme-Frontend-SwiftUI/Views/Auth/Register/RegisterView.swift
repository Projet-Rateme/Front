//
//  RegisterView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            VStack (spacing: 200) {
                CustomHeader(text: "Create your account")
                VStack(spacing: 50) {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(CustomTextField(icon: "envelope"))
                    Button(action: {
                        withAnimation {
                            viewRouter.currentRegisterPage = .registerPage2
                        }
                    }, label: {})
                        .buttonStyle(CustomButton(text: "Continue", isPrimary: true, color: "PrimaryColor"))
                    VStack {
                        VStack {
                            HStack(spacing: 5) {
                                Text("By clicking continue you agree to our")
                                    .font(Font.system(size: 12))
                                    .foregroundColor(Color("TextColor"))
                                Text("Privacy Policies")
                                    .font(Font.system(size: 12))
                                    .foregroundColor(Color("PrimaryColor"))
                                    .fontWeight(.semibold)
                            }
                            HStack(spacing: 5) {
                                Text("and our")
                                    .foregroundColor(Color("TextColor"))
                                    .font(Font.system(size: 12))
                                Text("Terms and Conditions.")
                                    .font(Font.system(size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("PrimaryColor"))
                            }
                        }
                        .multilineTextAlignment(.center)
                        
                    }
                }
                HStack {
                    Text("Already have an account?")
                    Text("Sign in")
                        .foregroundColor(Color("PrimaryColor"))
                        .onTapGesture {
                            withAnimation() {
                                viewRouter.currentPage = .loginView
                            }
                        }
                }.frame(alignment: .bottom)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterView()
            RegisterView().colorScheme(.dark)
        }
    }
}
