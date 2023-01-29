//
//  ProfileHeader.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 31/12/2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var Auth : AuthViewModel
    @EnvironmentObject var viewRouter : ViewRouter
    
    var currentUser : User?
    
    init () {
        if let data = UserDefaults.standard.data(forKey: "currentUser") {
            do {
                let currentUser = try JSONDecoder().decode(User.self, from: data)
                self.currentUser = currentUser
            } catch {
                print(error)
            }
        }
    }
    var body: some View {
        VStack(spacing: 100) {
            VStack {
                AsyncImage(url: URL(string: "https://res.cloudinary.com/practicaldev/image/fetch/s--OIzQOqaB--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1xsf81458f4dx7zrebgv.jpg")) { image in image
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width / 8)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 1, maxHeight: UIScreen.main.bounds.height / 4)
                
                AsyncImage(url: URL(string: "https://thispersondoesnotexist.com/image")) { image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Color(.darkGray)
                        .clipShape(Circle())
                        .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 4)
                .overlay(Circle().stroke(Color("PrimaryColor"), lineWidth: 4))
                .padding(.vertical, -60)
                .shadow(radius: 10)
            }
            
            VStack(spacing: 10) {
                HStack {
                    Text(self.currentUser?.firstname ?? "")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                    Text(self.currentUser?.lastname ?? "")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                }
                Text("Tunis, Tunisia")
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.light)
                    .font(Font.system(size: 18))
                Text("Essmi chawki ferroukhi naamel f application")
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.regular)
                    .font(Font.system(size: 18))
            }
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
