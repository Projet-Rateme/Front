//
//  ForgotPasswordStep2View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct ForgotPasswordStep1View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var readyToNavigate = false
    @State var smsSelected : Bool = false
    @State var emailSelected : Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack(spacing: 50) {
                    Image("ForgotPasswordImage")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: UIScreen.main.bounds.height / 3.5)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Select which contact details should we use to reset your password")
                            .foregroundColor(Color("TextColor"))
                            .lineLimit(3)
                    }
                    
                    VStack(spacing: 40) {
                        HStack {
                            VStack {
                                Image(systemName: "message")
                            }.frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: UIScreen.main.bounds.width / 7)
                                .background(Color(.gray))
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Via SMS")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("TextColor"))
                                    .font(Font.system(size: 12))
                            }
                        }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .leading)
                            .background(Color("TextFieldColor"))
                            .onTapGesture {
                                emailSelected = false
                                smsSelected = true
                            }
                            .overlay(RoundedRectangle(cornerRadius: 32).stroke(Color("PrimaryColor"), lineWidth: smsSelected ? 5 : 0))
                            .cornerRadius(32)
                        
                        HStack {
                            VStack {
                                Image(systemName: "envelope")
                            }.frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: UIScreen.main.bounds.width / 7)
                                .background(Color(.gray))
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Via Email")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("TextColor"))
                                    .font(Font.system(size: 12))
                            }
                        }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .leading)
                            .background(Color("TextFieldColor"))
                            .onTapGesture {
                                emailSelected = true
                                smsSelected = false
                            }
                            .overlay(RoundedRectangle(cornerRadius: 32).stroke(Color("PrimaryColor"), lineWidth: emailSelected ? 5 : 0))
                            .cornerRadius(32)
                        
                        Button(action: {
                            if emailSelected {
                                self.readyToNavigate = true
                            }
                        }, label: {})
                        .buttonStyle(CustomButton(text: "Continue", isPrimary: true, color: "PrimaryColor"))
                    }
                }
                .foregroundColor(.white)
                .padding()
            }.navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $readyToNavigate) {
                    ForgotPasswordStep2View()
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button (action: {
                            self.presentationMode.wrappedValue.dismiss()
                        })
                        {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("Forgot password")
                            }
                        }
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                    }
                }
        }
    }
}

struct ForgotPasswordStep2View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForgotPasswordStep2View()
            ForgotPasswordStep2View().colorScheme(.dark)
        }
    }
}
