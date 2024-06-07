//
//  SplashView.swift
//  SafeLogin
//
//  Created by Apprenant89 on 04/06/2024.
//

import SwiftUI

struct SplashView: View {

    @State private var scale = 0.0
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Background"))
                .ignoresSafeArea()

            GeometryReader { proxy in
                let size = proxy.size

                ZStack {
                    VStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size.width / 2, height: size.width / 2)
                            .scaleEffect(scale)
                            .animation(.interactiveSpring(
                                response: 1,
                                dampingFraction: 0.4,
                                blendDuration: 1.5
                            ), value: scale)
                            .onAppear {
                                scale = 1

                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    withAnimation {
                                        self.isActive = true
                                    }
                                }
                            }

                        Text("Safe Login")
                            .font(Font.custom("Futura", size: 40))
                            .foregroundStyle(Color("FontColor"))
                            .fontWeight(.bold)
                            .font(.title)
                            .padding(30)
                     }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    SplashView(isActive: .constant(true))
}
