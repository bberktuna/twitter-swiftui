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

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView{
            
        
        ZStack {
            VStack(spacing: 14) {
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 100)
                            
                
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
                }.padding(.top, 44)
                
                HStack() {
                    ZStack(alignment: .leading) {
                        Image(systemName: "lock.fill")
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
                
                HStack {
                    Spacer()
                    Button(
                        action: {},
                        label: {
                            Text("Forgot Password?")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.vertical)
                        })
                }
                
                NavigationLink(
                    destination: FeedView(),
                    label: {
                        Text("Login")
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .clipped()
                            .background(.white)
                            .cornerRadius(24)
                    })

                    Spacer()

                NavigationLink(
                    destination: RegisterView() ,
                    label: {
                        HStack {
                            Text("Don't have an account?")
                            Text("Register")
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
