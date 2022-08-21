//
//  ProfileView.swift
//  twitterClone
//
//  Created by berk tuna on 19/06/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    private let user: User
    @ObservedObject private var viewModel: ProfileViewModel
    @State private var selectedFilter: TweetFilterOptions = .tweets
    @State private var editProfilePresented = false
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        ScrollView {
            
            ProfileHeaderView(viewModel: viewModel, editProfilePresented: $editProfilePresented, isFollowed: $viewModel.isFollowed)
            
            FilterButtonView(selectedOption: $selectedFilter)
                .padding()
            
            ForEach(0..<9) { tweet in
                FeedCell()
                    .padding(.horizontal)
            }
        }.edgesIgnoringSafeArea(.top)
            .animation(.spring())
            .transition(.move(edge: .leading))
            .navigationTitle(user.username)
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
