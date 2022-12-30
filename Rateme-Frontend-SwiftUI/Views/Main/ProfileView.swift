//
//  ProfileView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            VStack {
                Text("Hello this is profile view")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
