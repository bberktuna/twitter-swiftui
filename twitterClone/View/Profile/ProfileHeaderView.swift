//
//  ProfileHeaderView.swift
//  twitterClone
//
//  Created by berk tuna on 21/08/2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var editProfilePresented: Bool
    @Binding var isFollowed: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Image("wallpaper")
                .resizable()
                .frame(maxWidth: 410, maxHeight: 150 )
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(RoundedRectangle(cornerRadius: 70)
                        .stroke(.white, lineWidth: 4))
                    .padding(.horizontal)
                    .padding(.top, -30)
                Spacer()
                
                
                ProfileActionButtonView(viewModel: viewModel, editProfilePresented: $editProfilePresented, isFollowed: $isFollowed)



            }
            VStack(alignment: .leading) {
                Text(viewModel.user.fullname).font(.system(size: 20, weight: .bold))
                Text("@\(viewModel.user.username)").font(.system(size: 14)).foregroundColor(.gray).padding(.bottom, 4)
                HStack {
                    Image(systemName: "calendar").foregroundColor(.gray)
                    Text("Joined December 2021").font(.system(size: 14)).foregroundColor(.gray)
                }.padding(.bottom, 2)
                
                HStack {
                    Text("23").font(.system(size: 14, weight: .bold))
                    Text("Following").font(.system(size: 14)).foregroundColor(.gray)
                    Text("0").font(.system(size: 14, weight: .bold))
                    Text("Followers").font(.system(size: 14)).foregroundColor(.gray)
                }
                
            }.padding(.horizontal)

        }.padding(.bottom)
        
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView(isFollowing: .constant(false), isCurrentUser: .constant(false))
//    }
//}
