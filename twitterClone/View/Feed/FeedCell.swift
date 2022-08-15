//
//  FeedCell.swift
//  twitterClone
//
//  Created by berk tuna on 07/06/2022.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
       
        VStack{
            HStack(alignment: .top) {
                //pic name username dots
                Image("cat")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFit()
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("name")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("@username")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text("- 2w")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Spacer()

                        Image(systemName: "ellipsis")
                            .frame(width: 32, height: 32)
                            .padding(.top, -10)
                    }
                    Text("qwdqwdqwdqwdqwdwqdqwdqwdqwdqwdqwdwqdqwdqwdqwdqwdqwdwqdq,adqqd;wnd;qwk")
                        .font(.system(size: 14))
                        .padding(.trailing, 6)
                }

            }.padding(.horizontal, 6)
            
            
            HStack() {
                Spacer()
                Button(
                    action: {
                },
                    label: {
                        Image(systemName: "bubble.left")
                            .frame(width: 30, height: 30)
                        Text("14")
                            .font(.system(size: 14 ))
                    })

                
                Spacer()
                
                Button(
                    action: {
                },
                    label: {
                        Image(systemName: "arrow.2.squarepath")
                            .frame(width: 32, height: 32)
                        Text("14")
                            .font(.system(size: 14 ))
                    })

                Spacer()
                
                
                Button(
                    action: {
                },
                    label: {
                        Image(systemName: "heart")
                            .frame(width: 32, height: 32)
                        Text("14")
                            .font(.system(size: 14 ))
                    })
                
                Spacer()
                
                Button(
                    action: {
                },
                    label: {
                        Image(systemName: "square.and.arrow.up")
                            .frame(width: 32, height: 32)

                    })

            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 18, alignment: .topLeading)
            .padding(.horizontal)
            .padding(.bottom)
            .foregroundColor(.gray)

        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
