//
//  ContentView.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        TabView {
            NavigationStack {
                CatalogView()
                    .environmentObject(viewModel)
            }
            .tabItem { Label("Продукты",systemImage: "square.grid.3x3")}
            NavigationStack {
                FavoritesView()
                    .environmentObject(viewModel)
            }
            .tabItem { Label("Любимые товары",systemImage: "heart")}
            NavigationStack {
                BasketView()
                    .environmentObject(viewModel)
            }
            .tabItem { Label("Корзина",systemImage: "basket")}
            
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(ViewModel())
}
