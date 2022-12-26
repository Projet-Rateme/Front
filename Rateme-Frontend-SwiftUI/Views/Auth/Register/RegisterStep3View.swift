//
//  RegisterStep3View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct RegisterStep3View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            viewRouter.currentRegisterPage = .registerPage4
                        }
                    }, label: {})
                        .buttonStyle(CustomButton(text: "Continue", isPrimary: true, color: "PrimaryColor"))
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            viewRouter.currentRegisterPage = .registerPage2
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Select your country")
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct RegisterStep3View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterStep3View()
            RegisterStep3View().colorScheme(.dark)
        }
    }
}
