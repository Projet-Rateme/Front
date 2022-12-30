//
//  TestView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 25/12/2022.
//

import SwiftUI
import ActivityIndicatorView

struct TestView: View {
    
    @State var text = ""

    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            VStack {
                Button(action: {}, label: {})
                    .buttonStyle(CustomButton(text: "Get Started", isPrimary: true, color: "PrimaryColor"))
                Button(action: {}, label: {})
                    .buttonStyle(CustomButton(text: "Connect with google", isPrimary: false, icon: Image("Google"), color: "SecondaryColor"))
                CustomHeader(text: "Login to your account")
                    .padding(.leading, 45)
//                TextField("Name", text: $text)
//                    .textFieldStyle(CustomTextField(icon: "person"))
//                SecureField("Password", text: $text)
//                    .textFieldStyle(CustomTextField(icon: "lock"))
                
                ZStack {
                    Color("TextFieldColor")
                    VStack {
                        Text("title")
                            .foregroundColor(Color("TextColor"))
                    }
                }
                .background(.gray)
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.quaternary, lineWidth: 1)
                }
                
            }
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestView()
            TestView().colorScheme(.dark)
        }
    }
}
