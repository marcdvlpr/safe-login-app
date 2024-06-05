//
//  RegisterView.swift
//  SafeLogin
//
//  Created by Apprenant 125 on 04/06/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var emailfield: String = ""
    @State private var passwordfield: String = ""
    @State private var isPasswordVisible: Bool = false
    var body: some View {
        VStack {
                        Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
//            Spacer()
                .padding()
            VStack(alignment: .leading) {
                Text("Email")
                    .multilineTextAlignment(.leading)
                HStack {
                    Image(systemName: "envelope")
                    TextField("Enter your Email", text: $emailfield)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 10)
                        .overlay(Rectangle().padding(.top, 41))
                        .foregroundStyle(Color.gray)
                        .padding(10)
                }
                .padding(.bottom)
                Text("Password")
                    .multilineTextAlignment(.leading)
                HStack {
                    Image(systemName: "lock")
                    if isPasswordVisible {
                        TextField("Password", text: $passwordfield)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } else {
                        SecureField("Enter your Password", text: $passwordfield)
                            .padding(.vertical, 10)
                            .overlay(Rectangle().padding(.top, 40))
                            .foregroundStyle(Color.gray)
                            .padding(10)
                        Image(systemName: isPasswordVisible ? "eye.splash.fill" : "eye.fill")
                    }
                    Spacer()
                }
                Spacer()
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(40)
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
        RegisterView()
    }

