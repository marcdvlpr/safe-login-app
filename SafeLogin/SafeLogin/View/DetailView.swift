//
//  DetailView.swift
//  SafeLogin
//
//  Created by Apprenant89 on 06/06/2024.
//

import SwiftUI

struct DetailView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var website: String = ""
    @State private var buttonCopy: Bool = false
    @State private var passwordCopied: Bool = false
    var body: some View {
        NavigationView {
            HStack {
                VStack(alignment: .leading) {
                    List {
                        Text("Username")
                        HStack {
                            TextField("Username", text: $username, prompt: Text("johndoe@gmail.com"))
                            Button {
                                UIPasteboard.general.string = username
                                buttonCopy = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    buttonCopy = false
                                }
                            } label: {
                                Image(systemName: buttonCopy ? "checkmark.circle" : "doc.on.doc")
                                    .foregroundStyle(.gray)
                            }
                        }
                        Text("Password")
                        HStack {
                            SecureField("***********************", text: $password)
                            Spacer()
                            Menu {
                                Button("Copy") {
                                    UIPasteboard.general.string = password
                                    passwordCopied = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        passwordCopied = false
                                    }
                                }
                            }label: {
                                Image(systemName: passwordCopied ? "checkmark.circle" : "ellipsis.circle")
                                    .foregroundStyle(.gray)
                            }
                        }
                        if hasEightCharacters(password: password) {
                            Text("Le mot de passe est fort")
                                .foregroundColor(.green)
                        } else {
                            Text("Le mot de passe n'est pas asser fort")
                                .foregroundColor(.red)
                        }
                    }
                    List {
                        Text("website")
                        TextField("", text: $website, prompt: Text("www.ubereats.com"))
                    }
                    .frame(height: 400)
                }
                .navigationTitle("Uber Eats")
                .padding(.top)
            }
        }
    }
    func hasEightCharacters(password: String) -> Bool {
        return password.count >= 8
}

}

#Preview {
    DetailView()
}
