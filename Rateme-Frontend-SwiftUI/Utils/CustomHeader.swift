//
//  CustomHeader.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 25/12/2022.
//

import SwiftUI

struct CustomHeader: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 40))
            .foregroundColor(Color("TextColor"))
            .fontWeight(.semibold)
            .lineLimit(nil)
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct CustomHeader_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeader(text: "Log in to your account")
    }
}
