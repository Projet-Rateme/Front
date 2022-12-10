//
//  DisplayModeView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 10/12/2022.
//

import SwiftUI

struct DisplayModeView: View {
    @AppStorage("isDarkMode") private var isDarkMode = true
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea(.all)
            
            VStack {
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                Spacer()
            }.padding(.top, 30)
        }.navigationBarItems(
            leading:
                HStack {
                    Button(action : {
                        self.mode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color("TextColor"))
                    }
                    Text("Display Mode")
                        .font(Font.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.leading, 7)
                        .foregroundColor(Color("TextColor"))
                }
        )
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .toolbarBackground(
            Color("bgColor"),
            for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct DisplayModeView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayModeView()
    }
}
