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
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if isActive {
                if viewModel.userSession != nil {
                    MainTabView()
                } else {
                    LoginView()
                }
            } else {
                SplashView(isActive: $isActive)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
