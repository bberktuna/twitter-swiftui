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
    @State var fullName = ""
    @State var username = ""
    var body: some View {
        ZStack {
            VStack(spacing: 14) {
                Image("plus_photo")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .padding(.top, 50)
                    .foregroundColor(.white)
                            
                
                HStack() {
                    ZStack(alignment: .leading) {
                        Image(systemName: "person")
                            .frame(width: 34, height: 34)
                            .foregroundColor(.white)
                        
                        TextField("Full Name", text: $fullName)
                            .font(.system(size:16))
                            .padding()
                            .padding(.leading)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                       
                    }
                }.padding(.top, 44)
                
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
                    action: {},
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
                
                Button(
                    action: {},
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
