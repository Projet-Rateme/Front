//
//  RegisterStep2View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct RegisterStep2View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var readyToNavigate = false
    @State var email = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack (spacing: 50) {
                    Text("Code has been sent to m***6.*****@gmail.com")
                    VStack(spacing: 50) {
                        TextField("OTP Password", text: $email)
                            .textFieldStyle(CustomTextField(icon: "envelope"))
                        Text("Resend code in 53 s")
                        Button(action: {
                            if email != "" {
                                self.readyToNavigate = true
                            }
                        }, label: {})
                            .buttonStyle(CustomButton(text: "Verify", isPrimary: true, color: "PrimaryColor"))
                        VStack {
                            VStack {
                                HStack(spacing: 5) {
                                    Text("By clicking verify you agree to our")
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
                }
            }.navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $readyToNavigate) {
                    RegisterStep3View()
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button (action: {
                            self.presentationMode.wrappedValue.dismiss()
                        })
                        {
                            HStack {
                                Image(systemName: "arrow.left")
                            }
                        }
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                    }
                }
        }
    }
}

struct RegisterStep2View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterStep2View()
            RegisterStep2View().colorScheme(.dark)
        }
    }
}
