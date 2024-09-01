//
//  FavoritesView.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.likes) { iteam in 
                    FavoritDetailView(product: iteam)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Любимые товары")
    }
}

#Preview {
    NavigationStack{
        FavoritesView()
            .environmentObject(ViewModel())
    }
}
