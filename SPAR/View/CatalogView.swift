//
//  CatalogView.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct CatalogView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var screenStatus: Bool = true
    @State private var coloumns = [
        GridItem(.flexible(),spacing: 0),
        GridItem(.flexible(),spacing: 0)
    ]
    
    var body: some View {
        NavigationStack {
            
            if screenStatus {
                List(viewModel.products, id: \.id) { iteam in
                    RowCartProduct(product: iteam)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            } else {
                ScrollView(.vertical,showsIndicators: false) {
                    LazyVGrid(columns: coloumns, spacing: 5) {
                        ForEach(viewModel.products) { product in
                            CellCardProduct(product: product)
                        }
                    }
                    .padding(.top)
                }
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        screenStatus.toggle()
                    }
                } label: {
                    switch screenStatus {
                    case true: ButtonListStatus()
                    case false: ButtonTileStatus()
                    }
                }
                .padding(.bottom,8)
            }
        }
        .environmentObject(viewModel)
    }
}


#Preview {
    NavigationStack {
        CatalogView()
            .environmentObject(ViewModel())
    }
}


