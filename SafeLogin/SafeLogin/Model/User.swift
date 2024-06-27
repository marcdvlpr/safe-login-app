//
//  User.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 27/06/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let username: String?
}
