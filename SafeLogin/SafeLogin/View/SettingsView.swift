//
//  SettingsView.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 27/06/2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            List {
                Section {
                    Button {
                        print("LOGOUT")
                        viewModel.logout()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.left.circle")
                                .imageScale(.small)
                                .font(.title)
                                .foregroundStyle(Color(.systemRed))

                            Text("Log Out")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemRed))

                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
