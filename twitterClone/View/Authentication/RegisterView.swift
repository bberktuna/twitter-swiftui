//
//  LoginView.swift
//  twitterClone
//
//  Created by berk tuna on 17/08/2022.
//

import SwiftUI

private func fooo() -> UIColor {

    return #colorLiteral(red: 0.1171251312, green: 0.632802248, blue: 0.9511669278, alpha: 1)
}

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var image: Image?

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 14) {
                
                Button(
                    action: {
                        showImagePicker.toggle()
                    },
                    label: {
                        ZStack {
                            if let image = image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .clipShape(Circle())
                                    .padding(.top, 60)
                                    .foregroundColor(Color(.init(white: 1, alpha: 0.7)))
                            } else {
                                Image("plus_photo")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .padding(.top, 50)
                                    .foregroundColor(.white)
                            }
                        }
                    }).sheet(
                        isPresented: $showImagePicker,
                        onDismiss: loadImage,
                        content: {
                            ImagePicker(image: $selectedImage)
                        })

                            
                
                HStack() {
                    ZStack(alignment: .leading) {
                        Image(systemName: "person")
                            .frame(width: 34, height: 34)
                            .foregroundColor(.white)
                        
                        TextField("Full Name", text: $fullname)
                            .font(.system(size:16))
                            .padding()
                            .padding(.leading)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                       
                    }
                }.padding(.top, 24)
                
                HStack() {
                    ZStack(alignment: .leading) {
                        Image(systemName: "envelope")
                            .frame(width: 34, height: 34)
                            .foregroundColor(.white)
                        
                        TextField("Email", text: $email)
                            .font(.system(size:16))
                            .padding()
                            .padding(.leading)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                       
                    }
                }
                
                HStack() {
                    ZStack(alignment: .leading) {
                        Image(systemName: "person")
                            .frame(width: 34, height: 34)
                            .foregroundColor(.white)
                        
                        TextField("Username", text: $username)
                            .font(.system(size:16))
                            .padding()
                            .padding(.leading)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                       
                    }
                }
                
                HStack() {
                    ZStack(alignment: .leading) {
                        Image(systemName: "lock")
                            .frame(width: 34, height: 34)
                            .foregroundColor(.white)
                        
                        TextField("Password", text: $password)
                            .font(.system(size:16))
                            .padding()
                            .padding(.leading)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                       
                    }
                }
                
                Button(
                    action: {
                        guard let image = selectedImage else { return }

                        viewModel.registerUser(
                            email: email,
                            password: password,
                            username: username,
                            fullname: fullname,
                            profileImage: image
                        )
                    },
                    label: {
                        Text("Register")
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .clipped()
                            .background(.white)
                            .cornerRadius(24)
                    })

                    Spacer()
                
                NavigationLink(
                    destination: LoginView(),
                    label: {
                        HStack {
                            Text("Already have an account?")
                            Text("Login")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    }).padding(.bottom)
            }
            .padding(.horizontal, 24)
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity)
        .background(Color(#colorLiteral(red: 0.1171251312, green: 0.632802248, blue: 0.9511669278, alpha: 1)))
        .ignoresSafeArea()

    }
}



extension RegisterView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
