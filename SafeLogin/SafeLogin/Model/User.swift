//
//  User.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 27/06/2024.
//

import Foundation

/// A model representing a user in the application.
///
/// The `User` struct stores information about a user, including their unique identifier, email address, and username.
/// This struct conforms to `Identifiable` and `Codable` protocols.
///
/// - Note: The `username` property is optional and defaults to an empty string.
///
struct User: Identifiable, Codable {
    let id: String
    let email: String
    var username: String? = ""
}
