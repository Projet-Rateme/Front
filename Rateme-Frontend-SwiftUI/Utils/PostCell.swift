//
//  PostCell.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI
import ActivityIndicatorView

struct PostCell: View {
    let name : String
    let profilePicture : String
    let imageUrl : String?
    let text : String?
    @ObservedObject var Post = PostViewModel()
    var body: some View {
        ZStack {
            Color("bgColor").shadow(radius: 20)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    AsyncImage(url: URL(string: profilePicture)) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .frame(width: UIScreen.main.bounds.width / 8)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 8)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(name)
                            .foregroundColor(Color("TextColor"))
                            .fontWeight(.medium)
                        Text("20m ago")
                            .foregroundColor(Color(.gray))
                            .fontWeight(.light)
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .padding(.trailing, 5)
                }.padding()
                
                Text(text ?? "")
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.light)
                    .font(Font.system(size: 18))
                    .padding(.leading, 20)
                
                AsyncImage(url: URL(string: imageUrl ?? "")) { image in image
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width / 8)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 1, maxHeight: UIScreen.main.bounds.height / 3.5)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(.orange))
                        .fontWeight(.light)
                    Text("4.5")
                        .font(Font.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(.red))
                        .fontWeight(.light)
                    Text("478")
                        .font(Font.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Image(systemName: "message")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.light)
                    Text("123")
                        .font(Font.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                    Spacer()
                    Image(systemName: "bookmark")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.light)
                }.padding()
                
                Divider()
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostCell(name : "Chawki Ferroukhi", profilePicture: "https://thispersondoesnotexist.com/image", imageUrl: "https://res.cloudinary.com/practicaldev/image/fetch/s--OIzQOqaB--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1xsf81458f4dx7zrebgv.jpg", text: "test")
            PostCell(name : "Chawki Ferroukhi", profilePicture: "https://thispersondoesnotexist.com/image", imageUrl: "https://res.cloudinary.com/dfctbqlmj/image/upload/v1672409964/j7f9pzoqto1foym93mlh.jpg", text : "Significant backend server architecture changes rolled out. Twitter should feel faster.").colorScheme(.dark)
        }
        
    }
}
