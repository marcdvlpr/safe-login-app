//
//  LoginView.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 04/06/2024.
//

import SwiftUI

struct LoginView: View {

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)

                    Text("Safe Login")
                        .foregroundStyle(Color("FontColor"))
                        .fontWeight(.bold)
                        .font(.title)

                    Spacer()

                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color("FontColor"))

                        TextField("",
                                  text: $email,
                                  prompt: Text("Enter your email")
                                            .foregroundStyle(Color("Gray"))
                        )
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .overlay(
                            Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                                .foregroundColor(Color("Gray")),
                            alignment: .bottom
                        )
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                    }
                    .padding()

                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color("FontColor"))

                        AnimatedSecureTextField(text: $password, titleKey: "Enter your password")
                    }
                    .padding()

                    Spacer()

                    NavigationLink {
                        EmptyView()
                    } label: {
                        HStack {
                            Text("Login")
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(.white)
                        .background(Color("Primary"))
                        .cornerRadius(36)
                        .padding()
                    }

                    NavigationLink {
                        RegisterView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 5) {
                            Text("Don't have an account?")

                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        .font(.footnote)
                        .foregroundStyle(Color("DarkCyan"))
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color("Background"))
        }
    }
}

struct AnimatedSecureTextField: View {

    @Binding var text: String
    @State var isSecure: Bool = true
    var titleKey: String

    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                SecureField("",
                            text: $text,
                            prompt: Text("Enter your password")
                    .foregroundStyle(Color("Gray"))
                )
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .overlay(
                    Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                        .foregroundColor(Color("Gray")),
                    alignment: .bottom
                )
            } else {
                TextField(titleKey, text: $text)
                TextField("",
                          text: $text,
                          prompt: Text("Enter your email")
                                    .foregroundStyle(Color("Gray"))
                )
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .overlay(
                    Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                        .foregroundColor(Color("Gray")),
                    alignment: .bottom
                )
            }

            Button(action: {
                isSecure = !isSecure
            }, label: {
                Image(systemName: !isSecure ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
                    .padding()
            })
        }
    }
}

#Preview {
    LoginView()
}
