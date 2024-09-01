//
//  FavoritDetailView.swift
//  SPAR
//
//  Created by admin on 31/8/2024.
//

import SwiftUI

struct FavoritDetailView: View {
    var product: Product
    
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        HStack{
            VStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 120,height: 120)
            VStack(alignment: .leading) {
                Text(product.title)
                Text(product.price.twoDigits())
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            Image(product.like ? "loveGreen" : "love")
                .resizable()
                .scaledToFit()
                .frame(width: 16,height: 16)
                .padding()
                .onTapGesture {
                    product.like.toggle()
                    viewModel.product = product
                    if viewModel.product.like {
                        viewModel.addProductLikes(product)
                    } else {
                        viewModel.deleteProductLikes(product)
                    }
                }
        }
    }
}

#Preview {
    FavoritDetailView(product: .init(image: "bread", rating: 4.1, reviewCount: 12, title: "Багет 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 100, priceSmal: 40, price: 100.40, oldPrice: 123.40, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: true))
        .environmentObject(ViewModel())
}
