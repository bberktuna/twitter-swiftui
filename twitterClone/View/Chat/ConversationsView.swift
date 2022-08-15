//
//  ChatView.swift
//  twitterClone
//
//  Created by berk tuna on 15/08/2022.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewChatView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing ) {
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
                            }
                        )
                    }
                }.padding()
            }
            
            Button(
                action: {
                    self.isShowingNewChatView.toggle()
                },
                label: {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .padding()
                        
                })
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(
                isPresented: $isShowingNewChatView,
                content: {
                SearchView()
            })
            
                
        }

        

    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
