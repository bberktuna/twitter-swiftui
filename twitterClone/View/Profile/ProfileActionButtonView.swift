//
//  ProfileActionButtonView.swift
//  twitterClone
//
//  Created by berk tuna on 21/08/2022.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var editProfilePresented: Bool
    @Binding var isFollowed: Bool
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(
                action: {
                    editProfilePresented.toggle()
                } ,
                label: {
                    Text("Edit profile")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius:30)
                                .stroke(.gray, lineWidth: 0.5)
                        )
                    
                })
//            .fullScreenCover(isPresented: $editProfilePresented) {
//                EditProfileView(isShowing: $editProfilePresented, user: viewModel.user)
            .padding(.trailing, 30)
                } else {
                    Button(
                        action: {
                            isFollowed ? viewModel.unfollow() : viewModel.follow()
                    } ,
                        label: {
                            Text(isFollowed ? "Following" : "Follow")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(isFollowed ? .black : .white)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .cornerRadius(20)
                                .background(isFollowed ? .white : .black)
                                .cornerRadius(30)
                                .overlay(
                                    RoundedRectangle(cornerRadius:30)
                                        .stroke(.black , lineWidth: 0.5)

                                )

                        })
                    .padding(.trailing, 30)
                }
    }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView()
//    }
//}


//    NavigationLink(destination: ChatView(user: viewModel.user), label: {
//        Text("Message")
//            .frame(width: 180, height: 40)
//            .background(Color.purple)
//            .foregroundColor(.white)
//    })
//    .cornerRadius(20)
