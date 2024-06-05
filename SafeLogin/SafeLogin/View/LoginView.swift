//
//  LoginView.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 04/06/2024.
//

import SwiftUI

struct LoginView: View {

    @State private var userName: String = ""
    @State private var password: String = ""
    @State var isSecure: Bool = true

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

                        TextField("Enter your email", text: $userName)
                            .padding()
                            .frame(height: 50)
                            .background(.white)
                            .cornerRadius(10)
                            .foregroundStyle(Color("DarkGray"))
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
                        .cornerRadius(10)
                        .padding()
                    }

                    NavigationLink {
                        EmptyView()
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
                SecureField(titleKey, text: $text)
                    .padding()
                    .padding(.trailing, 30)
                    .frame(height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(Color("DarkGray"))

            } else {
                TextField(titleKey, text: $text)
                    .padding()
                    .padding(.trailing, 30)
                    .frame(height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(Color("DarkGray"))
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
