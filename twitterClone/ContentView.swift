//
//  ContentView.swift
//  twitterClone
//
//  Created by berk tuna on 07/06/2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                            }
                        
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                            }
                        
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                            }
                    }
                    .navigationBarTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        leading: Button(
                            action: {
                                viewModel.signOut()
                            },
                            label: {
                                if let user = viewModel.user {
                                    KFImage(URL(string: user.profileImageUrl))
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                        .frame(width: 32, height: 32)
                                        .cornerRadius(16)

                                }
                            }),
                        
                        trailing: Button(
                            action: {
                                viewModel.signOut()
                            },
                            label:{
                                Image(systemName: "gearshape")
                                    .foregroundColor(.black)
                            }
                        ))
                    
                }
            } else {
                LoginView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
