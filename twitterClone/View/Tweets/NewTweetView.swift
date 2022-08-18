//
//  NewTweetView.swift
//  twitterClone
//
//  Created by berk tuna on 17/08/2022.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State var tweetText = ""
    var body: some View {
        NavigationView {
            VStack {
                
            HStack(alignment: .top) {
                Image("cat")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
                
                    TextEditor(text: $tweetText)
                        .frame(height: 200)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray.opacity(0.5)))
                Spacer()
            }
                
            .padding()
            .navigationBarItems(
                leading:
                    Button(
                        action: {
                            isPresented.toggle()
                        },
                        label: {
                            Text("Cancel")
                                .font(.system(size: 14, weight: .semibold))
                                .padding(.vertical, 8)
                                .padding(.horizontal)
                                .foregroundColor(.blue)
                                .clipShape(Capsule())
                        }),
                trailing:
                    Button(
                        action: {
                            
                        },
                        label: {
                            Text("Tweet")
                                .font(.system(size: 14, weight: .semibold))
                                .padding(.vertical, 8)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(.blue)
                                .clipShape(Capsule())
                        })
            )
                Spacer()

            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
