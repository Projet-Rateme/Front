//
//  CommentCell.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 2/1/2023.
//

import SwiftUI

struct CommentCell: View {
    var comment : Comment
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: "https://thispersondoesnotexist.com/image")) { image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width / 8)
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 8)
                
                HStack(spacing: 5) {
                    Text(comment.user.firstname)
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.medium)
                    Text("20m")
                        .foregroundColor(Color(.gray))
                        .fontWeight(.light)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }
            
            Text(comment.content)
                .foregroundColor(Color("TextColor"))
                .fontWeight(.light)
                .font(Font.system(size: 18))
        }.padding()
    }
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//    }
//}
