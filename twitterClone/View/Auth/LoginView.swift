//
//  LoginView.swift
//  twitterClone
//
//  Created by berk tuna on 07/06/2022.
//

import SwiftUI

struct LoginView: View {
    @State var username: String
    @State var password: String
    @State var onTabbedUsername: Bool = false
    @State var onTabbedPassword: Bool = false

    var body: some View {
        NavigationView {
        VStack {
            VStack() {
                TextField("username", text: $username )
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .semibold))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.vertical, 10)
                    .padding(.leading)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(
                            onTabbedUsername ? Color.black : Color.gray, lineWidth: 0.5))
                    .padding(.bottom, 14)
                    .onTapGesture {
                        onTabbedPassword = false
                        onTabbedUsername = true
                    }
                    
                    
                    
                
                SecureField("password", text: $password )
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .semibold))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.vertical, 10)
                    .padding(.leading)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(
                            onTabbedPassword ? Color.black : Color.gray, lineWidth: 0.5))
                    .padding(.bottom, 14)
                    .onTapGesture {
                        onTabbedUsername = false
                        onTabbedPassword = true
                    }

                NavigationLink(destination: FeedView()) {
                    Text("login")
                        .font(.system(size: 14, weight: .semibold, design: .monospaced))
                        .frame(width: 360, height: 40, alignment: .center)
                        .background(
                            username.isEmpty && password.isEmpty ?
                            Color.white : Color.black
                        )
                        .foregroundColor(username.isEmpty && password.isEmpty ?
                            .black : .white
                        )
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.black, lineWidth: 1)
                        )
                }.disabled(username.isEmpty && password.isEmpty ? true : false )

                
                Text("Forgot password?")
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(.blue)
                    .padding()
                
            }
            .padding()
            .padding(.top, 120)
            

            
                Spacer()
            NavigationLink(destination: RegisterView(username: "", password: "", email: ""), label: {
                Text("Don't have an account? ").font(.system(size: 14, weight: .semibold, design: .monospaced)).foregroundColor(.black)
                Text("Register").font(.system(size: 14, weight: .semibold, design: .monospaced)).foregroundColor(.blue)
            })
                
            
            }
        }.navigationBarHidden(true)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: "", password: "")
    }
}
