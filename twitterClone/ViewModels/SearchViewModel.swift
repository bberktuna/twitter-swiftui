//
//  SearchViewModel.swift
//  twitterClone
//
//  Created by berk tuna on 21/08/2022.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.map({ User.init(dictionary: $0.data())})
            
//            documents.forEach { document in
//                let user = User(dictionary: document.data())
//                self.users.append(user)
//            }
            
        }
    }
}
