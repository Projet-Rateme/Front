//
//  RegisterView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI
import ActivityIndicatorView

struct RegisterView: View {
    @EnvironmentObject var Auth : AuthViewModel
    @EnvironmentObject var viewRouter : ViewRouter
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack (spacing: 200) {
                    Spacer()
                    VStack(spacing: 50) {
                        Spacer()
                        Text(Auth.message)
                            .foregroundColor(.red)
                            .fontWeight(.semibold)
                        TextField("Email Address", text: $Auth.register_email)
                            .textFieldStyle(CustomTextField(icon: "envelope", text: $Auth.register_email))
                        Button(action: {
                            if Auth.register_email != "" {
                                Auth.isLoading = true
                                Auth.sendEmail()
                            }
                        }, label: {})
                        .buttonStyle(CustomButton(text: "Continue", isPrimary: true, color: "PrimaryColor"))
                        .disabled(Auth.isLoading)
                        
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
                    Spacer()
                    HStack {
                        Text("Already have an account?")
                        Text("Sign in")
                            .foregroundColor(Color("PrimaryColor"))
                            .onTapGesture {
                                viewRouter.currentPage = .loginView
                            }
                    }.frame(alignment: .bottom)
                    Spacer()
                }
            }.navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $Auth.readyToNavigate) {
                    RegisterStep2View()
                }
                
//            ZStack {
//                if Auth.alert {
//                    Color.black.opacity(0.5)
//                    .edgesIgnoringSafeArea(.all)
//                    .blur(radius: 10)
//                }
//            }
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
