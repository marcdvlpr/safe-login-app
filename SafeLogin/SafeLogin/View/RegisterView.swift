//
//  RegisterView.swift
//  SafeLogin
//
//  Created by Apprenant 125 on 04/06/2024.
//

import SwiftUI

struct RegisterView: View {

    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image(.logo)
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
                        MainTabView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            Text("Register")
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .background(Color("Primary"))
                        .cornerRadius(36)
                        .padding()
                    }

                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 5) {
                            Text("Already have an account?")

                            Text("Sign In")
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

#Preview {
    RegisterView()
}
