//
//  GeneratorViewModel.swift
//  SafeLogin
//
//  Created by Apprenant 125 on 26/06/2024.
//

import Foundation

/// ``GeneratorViewModel`` is a class for managing a random password generator.
class GeneratorViewModel {
/// A boolean for including Lowercase character in the password batch..
    var toggleazisOn: Bool
/// A boolean for including Uppercase letter in the password batch.
    var toggleAZisOn: Bool
/// A boolean for including number in the password batch.
    var toggle09isOn: Bool
/// A boolean for including special character in the password batch.
    var toggleCharisOn: Bool

/// Initializing of a new instance of ``GeneratorViewModel``.
    init(toggleazisOn: Bool, toggleAZisOn: Bool, toggle09isOn: Bool, toggleCharisOn: Bool) {
        self.toggleazisOn = toggleazisOn
        self.toggleAZisOn = toggleAZisOn
        self.toggle09isOn = toggle09isOn
        self.toggleCharisOn = toggleCharisOn
    }

/**``generatePassword`` function to generate a password about the parameters added.
 - Parameters:
    - length: to check the password length.
    - toggleAZisOn: to check if a Uppercase character is include.
    - toggleazisOn: to check if a Lowercase character is include.
    - toggle09isOn: to check if a number is include.
    - toggleCharisOn: to check if a special character is include.
    - Returns: a "String" that represents the generated password.*/
func generatePassword(length: Int, toggleAZisOn: Bool, toggleazisOn: Bool, toggle09isOn: Bool, toggleCharisOn: Bool) -> String {
        var characters = ""
        var password = ""

    if toggleazisOn {
        characters += "abcdefghijklmnopqrstuvwxyz"
        password += String((0..<1).compactMap { _ in "abcdefghijklmnopqrstuvwxyz".randomElement() })
    }
    if toggleAZisOn {
        characters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        password += String((0..<1).compactMap { _ in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement() })
    }
    if toggle09isOn {
        characters += "0123456789"
        password += String((0..<1).compactMap { _ in "0123456789".randomElement() })
    }
    if toggleCharisOn {
        characters += "!@#$%^&*()_-+=<>?"
        password += String((0..<1).compactMap { _ in "!@#$%^&*()_-+=<>?".randomElement() })
    }
        password += String((0..<length - password.count).compactMap { _ in characters.randomElement() })
        return password
    }
}
