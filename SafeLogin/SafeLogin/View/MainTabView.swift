//
//  MainTabView.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 07/06/2024.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)

            GeneratorView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    Text("Generator")
                }.tag(1)

            HomeView()
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(2)

            HomeView()
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(3)
        }
    }
}

#Preview {
    MainTabView()
}
