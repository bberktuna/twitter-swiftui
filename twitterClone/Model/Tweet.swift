//
//  User.swift
//  twitterClone
//
//  Created by berk tuna on 20/08/2022.
//

import Firebase

struct Tweet: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let caption: String
    let fullname: String
    let likes: Int
    let uid: String
    let timestamp: Timestamp


    
    init(dictionary: [String: Any]) {
        self.id = dictionary ["uid"] as? String ?? ""
        self.username = dictionary ["username"] as? String ?? ""
        self.caption = dictionary ["caption"] as? String ?? ""
        self.profileImageUrl = dictionary ["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary ["fullname"] as? String ?? ""
        self.likes = dictionary ["likes"] as? Int ?? 0
        self.uid = dictionary ["uid"] as? String ?? ""
        self.timestamp = dictionary ["timestamp"] as? Timestamp ?? Timestamp(date: Date())




    }
}
