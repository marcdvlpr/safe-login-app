//
//  AuthViewModel.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 27/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    let dbFire = Firestore.firestore()

    init() {}

    func createUser(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, email: email, username: "")
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            try await dbFire.collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
}