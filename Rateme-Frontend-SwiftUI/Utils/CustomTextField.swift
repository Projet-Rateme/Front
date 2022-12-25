//
//  CustomTextField.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 25/12/2022.
//

import SwiftUI

struct CustomTextField: TextFieldStyle {
    let icon: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            HStack {
                Image(systemName: icon)
                configuration
            }
            
            .padding(.leading)
            .foregroundColor(Color("TextColor"))
        }.frame(width: UIScreen.main.bounds.width / 1.2,
                height: UIScreen.main.bounds.width / 8)
        .foregroundColor(Color("TextFieldColor"))
        
    }
}
