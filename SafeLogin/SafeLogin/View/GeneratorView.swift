//
//  GeneratorView.swift
//  SafeLogin
//
//  Created by Apprenant 125 on 07/06/2024.
//

import SwiftUI

struct GeneratorView: View {

     @State private var generatedPassword: String = ""
     @State private var passwordLength: Double = 8
     @State private var toggleAZisOn: Bool = false
     @State private var toggleazisOn: Bool = false
     @State private var toggle09isOn: Bool = false
     @State private var toggleCharisOn: Bool = false

     var body: some View {
            VStack(alignment: .leading) {
                 Text("Generator")
                        .font(.title)
                        .bold()
                Spacer()

                 Text(generatedPassword)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                        .background(Color("DarkGray"))
                        .cornerRadius(10)

                Spacer()
                 HStack {
                        Text("Length")
                        Text(String(format: "%.0f", passwordLength))
                        Slider(value: $passwordLength, in: 8...20, step: 1)
                 }
                Spacer()

                 Toggle("A-Z", isOn: $toggleAZisOn)
                 Toggle("a-z", isOn: $toggleazisOn)
                 Toggle("0-9", isOn: $toggle09isOn)
                 Toggle("!@#$%^&*", isOn: $toggleCharisOn)
                 Spacer()

                 Button {
                        generatedPassword = generateRandomPassword(length: Int(passwordLength))
                 } label: {
                        Text("Generate your Password")
                             .frame(maxWidth: .infinity)
                             .padding()
                             .background(Color.blue)
                             .foregroundColor(.white)
                             .cornerRadius(40)
                 }
                 Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            .preferredColorScheme(.dark)
     }

     func generateRandomPassword(length: Int) -> String {
            var characters = ""
            if toggleazisOn {
                 characters += "abcdefghijklmnopqrstuvwxyz"
            }
            if toggleAZisOn {
                 characters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            }
            if toggle09isOn {
                 characters += "0123456789"
            }
            if toggleCharisOn {
                 characters += "!@#$%^&*()_-+=<>?"
            }
            return String((0..<length).compactMap { _ in characters.randomElement() })
     }
}

#Preview {
    GeneratorView()
}
