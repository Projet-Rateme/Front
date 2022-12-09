//
//  OnBoardingView.swift
//  Rateme-frontend
//
//  Created by Chawki Ferroukhi on 2/12/2022.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var eye = false
    @State private var confirm = false
    @State var mail = ""
    @State private var image = UIImage()
    @State private var showSheet = false
       
    var body : some View{
        
        ZStack {
            Color("bgColor")
                .ignoresSafeArea(.all)
            
            VStack{
                VStack {
                        Image(uiImage: self.image)
                      .resizable()
                      .cornerRadius(50)
                      .frame(width: 100, height: 100)
                      .background(Color.black.opacity(0.2))
                      .aspectRatio(contentMode: .fill)
                      .clipShape(Circle())

             Text("Change photo")
                 .font(.headline)
                 .frame(maxWidth: .infinity)
                 .frame(height: 50)
                 .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                 .cornerRadius(16)
                 .foregroundColor(.white)
                     .padding(.horizontal, 20)
                     .onTapGesture {
                       showSheet = true
                     }
                }
            .padding(.horizontal, 20)
            .sheet(isPresented: $showSheet) {
                        // Pick an image from the photo library:
                   // ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                        //  If you wish to take a photo from camera instead:
                         ImagePicker(sourceType: .camera, selectedImage: self.$image)
                }
                VStack{
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(Color("TextColor"))
                            .frame(width: 15, height: 18)
                        TextField("Firstname", text: self.$mail)
                        
                        if mail != "" {
                            Image(systemName: "checkmark").foregroundColor(.green)
                        }
                        else{
                            Image(systemName: "xmark").foregroundColor(.red)
                        }
                        
                    }.padding(.vertical, 20)
                    
                    Divider()
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(Color("TextColor"))
                            .frame(width: 15, height: 18)
                        TextField("Lastname", text: self.$mail)
                        
                        if mail != "" {
                            Image(systemName: "checkmark").foregroundColor(.green)
                        }
                        else{
                            Image(systemName: "xmark").foregroundColor(.red)
                        }
                        
                    }.padding(.vertical, 20)
                    
                    Divider()
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(Color("TextColor"))
                            .frame(width: 15, height: 18)
                        TextField("Age", text: self.$mail)
                        
                        if mail != "" {
                            Image(systemName: "checkmark").foregroundColor(.green)
                        }
                        else{
                            Image(systemName: "xmark").foregroundColor(.red)
                        }
                        
                    }.padding(.vertical, 20)
                    
                    Divider()
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(Color("TextColor"))
                            .frame(width: 15, height: 18)
                        TextField("Gender", text: self.$mail)
                        
                        if mail != "" {
                            Image(systemName: "checkmark").foregroundColor(.green)
                        }
                        else{
                            Image(systemName: "xmark").foregroundColor(.red)
                        }
                        
                    }.padding(.vertical, 20)
                    
                    Divider()
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(Color("TextColor"))
                            .frame(width: 15, height: 18)
                        TextField("Country", text: self.$mail)
                        
                        if mail != "" {
                            Image(systemName: "checkmark").foregroundColor(.green)
                        }
                        else{
                            Image(systemName: "xmark").foregroundColor(.red)
                        }
                        
                    }.padding(.vertical, 20)
                    
                    
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    
                    Text("SIGNUP")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                    
                }.background(
                    Color("PrimaryColor")
                )
                .cornerRadius(8)
                .offset(y: -40)
                .padding(.bottom, -40)
                .shadow(radius: 15)
                
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnBoardingView()
            
            OnBoardingView()
                .environment(\.colorScheme, .dark)
        }
    }
}
