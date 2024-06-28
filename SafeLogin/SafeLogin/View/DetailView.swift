//
//  DetailView.swift
//  SafeLogin
//
//  Created by Apprenant89 on 06/06/2024.
//

import SwiftUI
import Combine

/// Une classe représentant les détails d'un compte utilisateur.
///
/// Cette classe gère les informations d'un compte utilisateur, y compris le nom d'utilisateur,
/// le mot de passe et le site web associé. Elle fournit également des fonctionnalités pour
/// copier ces informations dans le presse-papiers et vérifier la force du mot de passe.
class Detail: ObservableObject {
    /// Le nom d'utilisateur du compte.
    @Published var username: String = ""
    /// Le mot de passe du compte.
    @Published var password: String = ""
    /// L'URL du site web associé au compte.
    @Published var website: String = ""
    /// Indique si le bouton de copie du nom d'utilisateur a été récemment activé.
    @Published var buttonCopy: Bool = false
    /// Indique si le mot de passe a été récemment copié.
    @Published var passwordCopied: Bool = false

    /// Initialise une nouvelle instance de `Detail`.
    /// - Parameters:
    ///   - username: Le nom d'utilisateur initial.
    ///   - password: Le mot de passe initial.
    ///   - website: L'URL du site web initial.
    ///   - buttonCopy: L'état initial du bouton de copie du nom d'utilisateur.
    ///   - passwordCopied: L'état initial de la copie du mot de passe.
    init(username: String, password: String, website: String, 
         buttonCopy: Bool = false, passwordCopied: Bool = false) {
        self.username = username
        self.password = password
        self.website = website
        self.buttonCopy = buttonCopy
        self.passwordCopied = passwordCopied
    }
    /// Copie le nom d'utilisateur dans le presse-papiers.
    ///
    /// Cette méthode copie le nom d'utilisateur dans le presse-papiers du système et
    /// met à jour l'état du bouton de copie pendant 2 secondes.
    func copyUsername() {
        UIPasteboard.general.string = username
        buttonCopy = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.buttonCopy = false
        }
    }
    /// Copie le mot de passe dans le presse-papiers.
    ///
    /// Cette méthode copie le mot de passe dans le presse-papiers du système et
    /// met à jour l'état de la copie du mot de passe pendant 2 secondes.
    func copyPassword() {
        UIPasteboard.general.string = password
        passwordCopied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.passwordCopied = false
        }
    }
    
    /// Vérifie si le mot de passe a au moins huit caractères.
    /// - Parameter password: Le mot de passe à vérifier.
    /// - Returns: `true` si le mot de passe a au moins 8 caractères, sinon `false`.
    func hasEightCharacters(password: String) -> Bool {
        return password.count >= 8
    }
}

/// Une vue SwiftUI affichant et permettant la modification des détails d'un compte.
struct DetailView: View {
    /// L'objet `Detail` contenant les informations du compte.
    @StateObject var detail = Detail(username: "", password: "", website: "")

    /// Le corps de la vue.
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Username")) {
                    HStack {
                        TextField("Username", text: $detail.username, prompt: Text("johndoe@gmail.com"))
                        Button {
                            detail.copyUsername()
                        } label: {
                            Image(systemName: detail.buttonCopy ? "checkmark.circle" : "doc.on.doc")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                Section(header: Text("Password")) {
                    HStack {
                        SecureField("***********************", text: $detail.password)
                        Spacer()
                        Menu {
                            Button("Copy") {
                                detail.copyPassword()
                            }
                        } label: {
                            Image(systemName: detail.passwordCopied ? "checkmark.circle" : "ellipsis.circle")
                                .foregroundStyle(.gray)
                        }
                    }
                    if detail.hasEightCharacters(password: detail.password) {
                        Text("Le mot de passe est fort")
                            .foregroundColor(.green)
                    } else {
                        Text("Le mot de passe n'est pas assez fort")
                            .foregroundColor(.red)
                    }
                }
                Section(header: Text("Website")) {
                    HStack {
                        TextField("Website", text: $detail.website, prompt: Text("www.ubereats.com"))
                    }
                }
            }
            .navigationTitle("Uber Eats")
        }
    }
}

/// Prévisualisation de la vue DetailView
#Preview {
    DetailView()
}
