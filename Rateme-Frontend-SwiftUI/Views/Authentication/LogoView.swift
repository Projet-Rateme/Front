//
//  LogoView.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 9/12/2022.
//

import SwiftUI

struct LogoView: View {
    @State var rotate = false
       
       var body : some View{
           ZStack{
           //Rotate Layer
           Image("logo") // Outer image
               .resizable()
               .frame(width : 150 , height: 150)
               .shadow(color: .gray, radius: 5, x: 0.0, y: 0.0)
               .rotationEffect(.degrees(rotate ? -360 : 0))
               .animation(Animation.easeInOut(duration: 3))
               .onAppear() {
               self.rotate.toggle()
                   }
               }
       }
       
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
