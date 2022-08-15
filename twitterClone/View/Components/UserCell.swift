//
//  UserCell.swift
//  twitterClone
//
//  Created by berk tuna on 15/08/2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("cat")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("berktuna")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Berk Tuna")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }.padding(.leading)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
