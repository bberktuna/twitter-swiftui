//
//  ChatCell.swift
//  twitterClone
//
//  Created by berk tuna on 15/08/2022.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            
        HStack(spacing: 12) {
            Image("cat")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("berktuna")
                    .font(.system(size: 14, weight: .semibold))
                    
                
                Text("i am sending you a messagewwwq")
                    .font(.system(size: 14))
                    .lineLimit(2)
            }
            .foregroundColor(.black)
            .padding(.trailing)
            
        }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
