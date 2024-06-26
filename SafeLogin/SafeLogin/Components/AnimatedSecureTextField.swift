//
//  AnimatedSecureTextField.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 26/06/2024.
//

import SwiftUI

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
    AnimatedSecureTextField(text: .constant(""), titleKey: "")
}
