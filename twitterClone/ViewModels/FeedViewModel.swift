//
//  FeedViewModel.swift
//  twitterClone
//
//  Created by berk tuna on 22/08/2022.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    func fetchTweets(){
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.map({ Tweet(dictionary: $0.data() )})
        }
    }
}
