//
//  RegisterStep3View.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct RegisterStep3View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var readyToNavigate = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Button(action: {
                        self.readyToNavigate = true
                    }, label: {})
                        .buttonStyle(CustomButton(text: "Continue", isPrimary: true, color: "PrimaryColor"))
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $readyToNavigate) {
                RegisterStep4View()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
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
