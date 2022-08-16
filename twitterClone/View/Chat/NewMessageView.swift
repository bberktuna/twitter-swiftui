//
//  NewMessageView.swift
//  twitterClone
//
//  Created by berk tuna on 16/08/2022.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack {
                ForEach(0..<19) { _ in
                    HStack { Spacer() }
                    
                    Button(
                        action: {
                            self.show.toggle()
                            self.startChat.toggle()
                        },
                        label: {
                            UserCell()
                                .foregroundColor(.black)
                        }
                    )
                }
            }
        }
    
        
        
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
