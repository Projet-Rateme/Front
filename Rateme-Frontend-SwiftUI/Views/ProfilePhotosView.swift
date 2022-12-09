//
//  ProfilePhotosView.swift
//  Rateme-frontend
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct ProfilePhotosView: View {
    var body : some View{
        VStack {
            HStack {
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.5, maxHeight: UIScreen.main.bounds.height / 8)
                    .cornerRadius(20)
                Image("Photo")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.5, maxHeight: UIScreen.main.bounds.height / 8)
                    .cornerRadius(20)
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.5, maxHeight: UIScreen.main.bounds.height / 8)
                    .cornerRadius(20)
            }.padding()
            HStack {
                Image("Photo")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.5, maxHeight: UIScreen.main.bounds.height / 8)
                    .cornerRadius(20)
                Image("Photo2")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.5, maxHeight: UIScreen.main.bounds.height / 8)
                    .cornerRadius(20)
                Image("Photo")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width / 3.5, maxHeight: UIScreen.main.bounds.height / 8)
                    .cornerRadius(20)
            }.padding()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

struct ProfilePhotosView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfilePhotosView()
            
            ProfilePhotosView().environment(\.colorScheme, .dark)
        }
        
    }
}