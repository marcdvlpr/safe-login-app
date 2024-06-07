//
//  ContentView.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 03/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var isActive = false

    var body: some View {
        if isActive {
            LoginView()
        } else {
            SplashView(isActive: $isActive)
        }
    }
}

#Preview {
    ContentView()
}
