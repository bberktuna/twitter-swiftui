//
//  LoginView.swift
//  twitterClone
//
//  Created by berk tuna on 07/06/2022.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String
    @State var password: String
    @State var email: String
    @State var onTabbedUsername: Bool = false
    @State var onTabbedPassword: Bool = false
    @State var onTabbedEmail: Bool = false
    @Environment(\.presentationMode) var presentationMode


    var body: some View {

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
                        onTabbedEmail = false
                        onTabbedUsername = true
                        
                    }
                
                
                TextField("email", text: $email )
                frame(width: 460, height: 40, alignment: .center)
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .semibold))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(
                            onTabbedEmail ? Color.black : Color.gray, lineWidth: 0.5))
                    .onTapGesture {
                        onTabbedPassword = false
                        onTabbedUsername = false
                        onTabbedEmail = true

                    }
                    .padding()

                    
                
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
                        onTabbedEmail = false
                        onTabbedPassword = true
                    }

                Button { presentationMode.wrappedValue.dismiss() }
                    label:  {
                    Text("register")
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

                
            }
            .padding()
            .padding(.top, 120)
            

            
                Spacer()
            NavigationLink(destination: LoginView(username: "", password: "") , label: {
                Text("Already have an account? ").font(.system(size: 14, weight: .semibold, design: .monospaced)).foregroundColor(.black)
                Text("Login").font(.system(size: 14, weight: .semibold, design: .monospaced)).foregroundColor(.blue)
            }).navigationBarBackButtonHidden(true)
                
        
            
    }
        }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(username: "", password: "", email: "")
    }
}
