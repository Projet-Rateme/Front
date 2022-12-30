//
//  CustomAlert.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 29/12/2022.
//

import SwiftUI
import ActivityIndicatorView

struct CustomAlert: ViewModifier {
    @Binding var isPresented: Bool
    @Binding var hasIndicator : Bool
    let title: String
    let placeholder: String
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
                .disabled(isPresented)
            if isPresented {
                VStack {
                    Text(title)
                        .foregroundColor(Color("TextColor"))
                    ActivityIndicatorView(isVisible: $hasIndicator, type: .default())
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(width: 20, height: 20)
                }
                .foregroundColor(Color(.red))
                .frame(width: 250, height: 150)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.quaternary, lineWidth: 1)
                }
                .background(Color("TextFieldColor"))
                .cornerRadius(20)
                .shadow(radius: 10)
            }
        }
    }
}

extension View {
    public func customAlert(
        isPresented: Binding<Bool>,
        hasIndicator: Binding<Bool>,
        title: String,
        placeholder: String = ""
    ) -> some View {
        self.modifier(CustomAlert(isPresented: isPresented, hasIndicator: hasIndicator, title: title, placeholder: placeholder))
    }
}
