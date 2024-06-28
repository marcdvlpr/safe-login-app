//
//  AuthViewModel.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 27/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

/// ViewModel for handling user authentication and managing user session.
///
/// This class provides methods to create, log in, and log out users using Firebase Authentication.
/// It also fetches user information from Firestore and updates the current user session.
/// 
@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    let dbFire = Firestore.firestore()

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    /// Creates a new user with the given email and password, saves the user data to Firestore, 
    /// and fetches the user information.
    ///
    /// This function uses Firebase Authentication to create a new user account and stores the 
    /// user information in Firestore.
    /// After creating the user, it fetches the user data and updates the current session.
    ///
    /// - Parameters:
    ///   - email: The email address of the new user.
    ///   - password: The password for the new user account.
    ///
    /// - Throws: An error if there is a problem creating the user or saving the user data to Firestore.
    ///
    func createUser(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, email: email, username: "")
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            try await dbFire.collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user")
        }
    }

    /// Logs in an existing user with the given email and password and fetches the user information.
    ///
    /// This function uses Firebase Authentication to sign in an existing user account and updates the current session with the user information.
    /// After signing in, it fetches the user data.
    ///
    /// - Parameters:
    ///   - email: The email address of the user.
    ///   - password: The password for the user account.
    ///
    /// - Throws: An error if there is a problem logging in the user.
    ///
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in")
        }
    }

    /// Logs out the current user and clears the user session.
    ///
    /// This function uses Firebase Authentication to sign out the current user.
    /// It also clears the current user session and user information.
    ///
    /// - Throws: An error if there is a problem signing out the user.
    ///
    func logout() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out")
        }
    }

    /// Fetches the current user's information from Firestore and updates the current user.
    ///
    /// This function retrieves the current user's UID from Firebase Authentication, then fetches the user data from Firestore.
    /// The user data is decoded into a `User` object and updates the `currentUser` property.
    ///
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try? await dbFire.collection("users").document(uid).getDocument()
        guard let user = try? snapshot?.data(as: User.self) else { return }
        self.currentUser = user
    }
}
