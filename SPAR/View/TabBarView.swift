//
//  ContentView.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel = ViewModel()
    @State private var selectionTab =  1
    
    init() { UITabBar.appearance().isHidden = true }
    
    var body: some View {
    
        TabView(selection: $selectionTab) {
            NavigationStack {
                CatalogView()
                    .environmentObject(viewModel)
            }
            .tag(1)
            .tabItem { Label("Продукты",systemImage: "square.grid.3x3")}
            
            NavigationStack {
                FavoritesView()
                    .environmentObject(viewModel)
            }
            .tag(2)
            .tabItem { Label("Любимые товары",systemImage: "heart")}
            
            NavigationStack {
                BasketView()
                    .environmentObject(viewModel)
            }
            .tag(4)
            .tabItem { Label("Корзина",systemImage: "basket")}
        }
        
        ZStack(alignment: .bottom) {
            Rectangle()
                .frame(width: 500,height: 1)
                .offset(y: -62)
                .foregroundStyle(.gray)
            HStack {
                Button {
                    withAnimation(.spring()) {
                        selectionTab = 1
                    }
                } label: {
                    VStack {
                        Image(systemName: "square.grid.3x3")
                            .tint(selectionTab == 1 ? Color(hex: "15B742") : .gray)
                            .padding(4)
                        Text("Каталог")
                            .tint(selectionTab == 1 ? Color(hex: "15B742") : .gray)
                    }
                }
                Button {
                    withAnimation(.spring()) {
                        selectionTab = 2
                    }
                } label: {
                    VStack {
                        Image(systemName: "heart")
                            .tint(selectionTab == 2 ? Color(hex: "15B742") : .gray)
                            .padding(4)
                        Text("Понравилось")
                            .tint(selectionTab == 2 ? Color(hex: "15B742") : .gray)
                    }
                }
                Button {
                    //
                } label: {
                    VStack {
                        Image(systemName: "creditcard")
                            .tint(selectionTab == 3 ? Color(hex: "15B742") : .gray)
                            .padding(4)
                        Text("Карта")
                            .tint(selectionTab == 3 ? Color(hex: "15B742") : .gray)
                    }
                }
                Button {
                    withAnimation(.spring()) {
                        selectionTab = 4
                    }
                } label: {
                    VStack {
                        Image(systemName: "basket")
                            .tint(selectionTab == 4 ? Color(hex: "15B742") : .gray)
                            .padding(4)
                        Text("Корзина")
                            .tint(selectionTab == 4 ? Color(hex: "15B742") : .gray)
                    }
                }
                Button {
                    //
                } label: {
                    VStack {
                        Image(systemName: "person")
                            .tint(selectionTab == 5 ? Color(hex: "15B742") : .gray)
                            .padding(4)
                        Text("Профиль")
                            .tint(selectionTab == 5 ? Color(hex: "15B742") : .gray)
                    }
                }
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(ViewModel())
}
