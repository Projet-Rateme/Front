//
//  LoginViewRouter.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import SwiftUI

struct LoginViewRouter: View {
    @EnvironmentObject var viewRouter: ViewRouter
        
    var body: some View {
        Text("test")
    }
}

struct LoginViewRouter_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewRouter().environmentObject(ViewRouter())
    }
}

