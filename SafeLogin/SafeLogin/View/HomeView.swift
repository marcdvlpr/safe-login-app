//
//  HomeView.swift
//  SafeLogin
//
//  Created by Apprenant 124 on 06/06/2024.
//

import SwiftUI

struct HomeView: View {

    @State private var credentials = UserCredential.sampleData

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(credentials) { item in
                        NavigationLink {
                            DetailView()
                        } label: {
                            RowView(itemName: item.itemName,
                                    userName: item.userName)
                        }
                    }
                }
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {

                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                        .imageScale(.large)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color("Background"))
        }
    }
}

struct RowView: View {
    let itemName: String
    let userName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(itemName)
                    .foregroundStyle(Color("FontColor"))
                    .fontWeight(.bold)

                Text(userName)
                    .foregroundStyle(Color("Gray"))
                    .fontWeight(.thin)
            }
        }
    }
}

#Preview {
    HomeView()
}
