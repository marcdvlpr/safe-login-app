//
//  SplashView.swift
//  SafeLogin
//
//  Created by Apprenant89 on 04/06/2024.
//

import SwiftUI

struct SplashView: View {
    @State private var showSplash = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 200, height: 200)
        Text("Safe Login")
            .font(Font.custom(".SFUIText", size: 40))
            .foregroundColor(.white.opacity(0.80))
    }
}

#Preview {
    SplashView()
}
