//
//  ProfileView.swift
//  twitterClone
//
//  Created by berk tuna on 19/06/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                Image("wallpaper")
                    .resizable()
                    .frame(maxWidth: 410, maxHeight: 150 )
                HStack {
                    Image("cat3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .overlay(RoundedRectangle(cornerRadius: 70)
                            .stroke(.white, lineWidth: 4))
                        .padding(.horizontal)
                        .padding(.top, -30)
                    Spacer()
                    Button(
                        action: {} ,
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
                    .padding(.trailing)
                }
                VStack(alignment: .leading) {
                        Text("berk").font(.system(size: 20, weight: .bold))
                        Text("@berk18249y12").font(.system(size: 14)).foregroundColor(.gray).padding(.bottom, 4)
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

            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
