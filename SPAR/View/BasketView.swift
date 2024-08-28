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
        .environmentObject(viewModel)
    }
}

#Preview {
    BasketView()
        .environmentObject(ViewModel())
}


struct BasketDetailView: View {
    var product: Product
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Image(product.image)
            Text("\(product.count)")
            Button {
                viewModel.product = product
                product.count += 1
                print("plus")
            } label: {
                Text("plus")
            }
        }
        .environmentObject(viewModel)
    }
}
