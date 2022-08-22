//
//  AuthViewModel.swift
//  twitterClone
//
//  Created by berk tuna on 18/08/2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG FAILED TO LOGIN: \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            self.fetchUser()
            print("LOGGED IN SUC")
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
//        Auth.auth().createUser(withEmail: email, password: password ) { result, error in
//            if let error = error {
//                print("DEBUG: ERROR \(error.localizedDescription)")
//                return
//            }
            
            guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
            let filename = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child(filename)
            
            storageRef.putData(imageData, metadata: nil) {_, error in
                if let error = error {
                print("DEBUG: FAILED TO UPLOAD IMAGE \(error.localizedDescription)")
                return
            }
                
                storageRef.downloadURL { url, _ in
                    guard let profileImageUrl = url?.absoluteString else { return }
                    
                    Auth.auth().createUser(withEmail: email, password: password ) { result, error in
                        if let error = error {
                            print("DEBUG: ERROR \(error.localizedDescription)")
                            return
                        }
                        
                        guard let user = result?.user else { return }
                        print("DEBUG USER REGISTERED SUC")
                        
                        let data = [
                            "email": email.lowercased(),
                            "username": username.lowercased(),
                            "password": password,
                            "fullname": fullname.lowercased(),
                            "profileImageUrl": profileImageUrl,
                            "uid": user.uid
                        ]
                        
                        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                            self.userSession = user
                            self.fetchUser()
                            print("DEBUG SUCCESFULY UPLOADED USER DATA")
                        }
                    }
                }
            }
        }
    
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return } // IF USER LOGGED IN
        
        Firestore.firestore().collection("users").document(uid).getDocument() { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)        }
    }
}
