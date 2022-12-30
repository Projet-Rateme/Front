//
//  FeedView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 30/12/2022.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        PostCell()
                        PostCell()
                        PostCell()
                    }
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        HStack {
                            Text("Good morning Chawki")
                                .font(Font.system(size: 18))
                                .fontWeight(.semibold)
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        HStack {
                            Image(systemName: "person")
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
        FeedView().colorScheme(.dark)
    }
}
