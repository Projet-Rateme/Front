//
//  TestView.swift
//  Rateme-frontend
//
//  Created by Chawki Ferroukhi on 5/12/2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bgColor")
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Trending")
                            .fontWeight(.bold)
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                CurrentUserStoryView()
                                UsersStoryView()
                            }.padding(.bottom, 20)
                        }
                        
                        Divider()
                            .padding(.leading, 25)
                            .padding(.trailing, 25)
                        
                        PostCell().padding(.top, 10)
                    }.padding()
                }
            }.navigationBarItems(leading:Text("RateMe")
                .font(Font.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("TextColor")), trailing: Image("Direct").renderingMode(.template).foregroundColor(Color("TextColor")))
            .toolbarBackground(
                Color("bgColor"),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestView()
            
            TestView()
                .environment(\.colorScheme, .dark)
        }
    }
}
