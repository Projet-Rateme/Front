//
//  ForgotPasswordStep2View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct ForgotPasswordStep2View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var readyToNavigate = false
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
                                    .foregroundColor(Color("TextColor"))
                                    .font(Font.system(size: 12))
                                Text("+216 24239040")
                                    .foregroundColor(Color("TextColor"))
                                    .font(Font.system(size: 12))
                                    .fontWeight(.semibold)
                            }
                        }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .leading)
                            .background(Color("TextFieldColor"))
                            .cornerRadius(32)
                        
                        HStack {
                            VStack {
                                Image(systemName: "envelope")
                            }.frame(maxWidth: UIScreen.main.bounds.width / 4, maxHeight: UIScreen.main.bounds.width / 7)
                                .background(Color(.gray))
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Via Email")
                                    .foregroundColor(Color("TextColor"))
                                    .font(Font.system(size: 12))
                                Text("med6.chawk*@gmail.com")
                                    .foregroundColor(Color("TextColor"))
                                    .font(Font.system(size: 12))
                                    .fontWeight(.semibold)
                            }
                        }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .leading)
                            .background(Color("TextFieldColor"))
                            .cornerRadius(32)
                        
                        Button(action: {
                            self.readyToNavigate = true
                        }, label: {})
                        .buttonStyle(CustomButton(text: "Continue", isPrimary: true, color: "PrimaryColor"))
                    }
                }
                .foregroundColor(.white)
                .padding()
            }.navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $readyToNavigate) {
                    ForgotPasswordStep3View()
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
