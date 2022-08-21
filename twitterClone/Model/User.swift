//
//  User.swift
//  twitterClone
//
//  Created by berk tuna on 20/08/2022.
//

import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    //let isCurrentUser: Bool
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id}
    var isFollowed = false

    
    init(dictionary: [String: Any]) {
        self.id = dictionary ["uid"] as? String ?? ""
        self.username = dictionary ["username"] as? String ?? ""
        self.email = dictionary ["email"] as? String ?? ""
        self.profileImageUrl = dictionary ["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary ["fullname"] as? String ?? ""
        //self.isCurrentUser = Auth.auth().currentUser?.uid == self.id

    }
}
