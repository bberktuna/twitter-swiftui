//
//  Message.swift
//  twitterClone
//
//  Created by berk tuna on 16/08/2022.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
    
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "cat3", messageText: "hey what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "cat3", messageText: "how are you", isCurrentUser: false),
    .init(id: 2, imageName: "cat", messageText: "cool", isCurrentUser: true),
    .init(id: 3, imageName: "cat", messageText: "how about you?", isCurrentUser: true),

    .init(id: 4, imageName: "cat3", messageText: "same", isCurrentUser: false),
    .init(id: 5, imageName: "cat", messageText: "ok", isCurrentUser: true)


]
