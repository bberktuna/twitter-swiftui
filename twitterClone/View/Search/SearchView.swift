//
//  SearchView.swift
//  twitterClone
//
//  Created by berk tuna on 07/06/2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack {
                ForEach(0..<19) { _ in
                    UserCell()
                    Spacer()

                }
            }
        }
    
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
