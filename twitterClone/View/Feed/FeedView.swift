//
//  FeedView.swift
//  twitterClone
//
//  Created by berk tuna on 07/06/2022.
//

import SwiftUI

struct FeedView: View {
    
    @State var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing ) {
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        FeedCell()
                        Divider()
                    }
                    
                }
            }
            
            Button(
                action: {
                    isShowingNewTweetView.toggle()
                },
                label: {
                    Image("tweet")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .padding()
                        
                })
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView) { //.sheet
                NewTweetView(isPresented: $isShowingNewTweetView)
            }
            
                
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
