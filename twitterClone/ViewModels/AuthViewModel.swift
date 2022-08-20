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
    
    func login() {
        
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
                            "email": email,
                            "username": username,
                            "password": password,
                            "fullname": fullname,
                            "profileImageUrl": profileImageUrl,
                            "uid": user.uid
                        ]
                        
                        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                            print("DEBUG SUCCESFULY UPLOADED USER DATA")
                        }
                    }
                }
            }
        }
    }
