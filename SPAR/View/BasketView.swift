//
//  BasketView.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.trash) { iteam in
                BasketDetailView(product: iteam)
            }
        }
        //MARK: добавить задний фон когда пустая корзина 
        .listStyle(.plain)
        .environmentObject(viewModel)
    }
}

#Preview {
    BasketView()
        .environmentObject(ViewModel())
}




