//
//  ViewRouter.swift
//  Rateme-Frontend-SwiftUI
//
//  Created by Chawki Ferroukhi on 26/12/2022.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {

    init() {
//        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
//            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "OnBoardingView"
//        } else {
//            currentPage = "homeView"
//        }
    }
    
    @Published var currentPage: String
    
}
