//
//  CommentView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 2/1/2023.
//

import SwiftUI

struct CommentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var post : Post?
    @StateObject var postViewModel : PostViewModel
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            VStack {
                ScrollView {
                    PostCell(post: post!, postViewModel: postViewModel, likes: post!.likes)
                    ForEach(postViewModel.comments, id: \._id) { item in
                        CommentCell(comment: item)
                    }
                }
                Spacer()
                withAnimation {
                    AddNewCommentView(postViewModel: postViewModel, post: post!)
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
        .refreshable {
            postViewModel.fetchPostComments(post: post!)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button (action: {
                    self.presentationMode.wrappedValue.dismiss()
                })
                {
                    HStack {
                        Image(systemName: "arrow.left")
                    }
                }
                .foregroundColor(Color("TextColor"))
                .fontWeight(.bold)
            }
        }
    }
}
