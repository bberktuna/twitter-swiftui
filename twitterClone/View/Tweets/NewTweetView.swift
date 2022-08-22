//
//  NewTweetView.swift
//  twitterClone
//
//  Created by berk tuna on 17/08/2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State var captionText = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    var body: some View {
        NavigationView {
            VStack {
                
            HStack(alignment: .top) {
                if let user = AuthViewModel.shared.user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                }

                
                     TextEditor(text: $captionText)
                        .frame(height: 200)
                        .padding()
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
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
                            viewModel.uploadTweet(caption: captionText)
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
