//
//  AddNewCommentView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 2/1/2023.
//

import SwiftUI

struct AddNewCommentView: View {
    @StateObject var postViewModel : PostViewModel
    @State var post : Post?
    var body: some View {
        ZStack {
            HStack {
                TextField("Add Comment", text: $postViewModel.comment_content)
                    .textFieldStyle(CustomTextField(icon: "message", text: $postViewModel.comment_content))
                Button(action: {
                    postViewModel.createComment(post: post!)
                }) {
                    Image(systemName: "paperplane")
                        .foregroundColor(Color("TextColor"))
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/14)
        }
    }
}
