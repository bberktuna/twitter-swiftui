//
//  twitterCloneApp.swift
//  twitterClone
//
//  Created by berk tuna on 07/06/2022.
//

import SwiftUI
import Firebase

@main
struct twitterCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
