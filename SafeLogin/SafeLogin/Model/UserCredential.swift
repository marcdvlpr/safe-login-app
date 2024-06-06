//
//  Login.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 06/06/2024.
//

import Foundation

struct UserCredential: Identifiable {
    let id = UUID()
    let itemName: String
    let userName: String
    let password: String
    let website: String

    static var sampleData: [UserCredential] {
        [
            UserCredential(itemName: "Uber Eats",
                           userName: "johndoe@protonmail.com",
                           password: "QLK874$cv@R3#P6",
                           website: "https://www.ubereats.com"),
            UserCredential(itemName: "Instagram",
                           userName: "johndoe@protonmail.com",
                           password: "Y9#m?Rx7$42sXU3",
                           website: "https://www.instagram.com"),
            UserCredential(itemName: "iCloud",
                           userName: "johndoe@icloud.com",
                           password: "QLK874$cv@R3#P6",
                           website: "https://www.icloud.com"),
            UserCredential(itemName: "Binance",
                           userName: "johndoe@protonmail.com",
                           password: "W9#k=Rx7@45sXU1#j",
                           website: "https://www.binance.com"),
            UserCredential(itemName: "FDJ",
                           userName: "johndoe@protonmail.com",
                           password: "W9#k=Rx7@45sXU1#j",
                           website: "https://www.fdj.fr"),
            UserCredential(itemName: "Notion",
                           userName: "johndoe@icloud.com",
                           password: "W9#k=Rx7@45sXU1#j",
                           website: "https://www.notion.com"),
            UserCredential(itemName: "Figma",
                           userName: "johndoe@icloud.com",
                           password: "WK6g$Rx7@45D4?F#Oh",
                           website: "https://www.figma.com"),
            UserCredential(itemName: "Proton Mail",
                           userName: "johndoe@protonmail.com",
                           password: "W9#k=Rx7@45sXU1#j",
                           website: "https://www.proton.me"),
            UserCredential(itemName: "Hack the Box",
                           userName: "johndoe@protonmail.com",
                           password: "W9#k=Rx7@Uv49?U1#j",
                           website: "https://www.hackthebox.me")
        ]
    }
}
