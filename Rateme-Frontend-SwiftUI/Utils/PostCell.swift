//
//  PostCell.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    AsyncImage(url: URL(string: "https://thispersondoesnotexist.com/image")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 8)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Chawki Ferroukhi")
                            .foregroundColor(Color("TextColor"))
                            .fontWeight(.medium)
                        Text("20m ago")
                            .foregroundColor(Color(.gray))
                            .fontWeight(.light)
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .padding(.trailing, 5)
                }
                
                AsyncImage(url: URL(string: "https://res.cloudinary.com/practicaldev/image/fetch/s--OIzQOqaB--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1xsf81458f4dx7zrebgv.jpg")) { image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 1, maxHeight: UIScreen.main.bounds.height / 4)
                
                Divider()
            }.padding()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostCell()
            PostCell().colorScheme(.dark)
        }
        
    }
}
