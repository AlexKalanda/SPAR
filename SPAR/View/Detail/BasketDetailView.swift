//
//  BasketDetailView.swift
//  SPAR
//
//  Created by admin on 29/8/2024.
//

import SwiftUI

struct BasketDetailView: View {
    var product: Product
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        HStack {
            VStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 120,height: 120)
            HStack {
                VStack {
                    Text(product.title)
                        .font(.system(size: 14))
                    Spacer()
                    
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .overlay(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                HStack {
                    HStack(spacing: 0) {
                        Image(systemName: "minus")
                            .padding(.horizontal)
                            .padding(.vertical,12)
                            .background(Color(hex: "15B742"))
                            .onTapGesture {
                                viewModel.product = product
                                if viewModel.product.count == 1 {
                                    viewModel.deleteProductTrash(product)
                                    product.trash = false
                                } else {
                                    viewModel.product.count -= 1
                                }
                            }
                        Divider()
                        Text(product.count.description)
                            .padding(.horizontal,8)
                            .background(Color(hex: "15B742"))
                        Divider()
                        Image(systemName: "plus")
                            .padding(.horizontal)
                            .padding(.vertical,12)
                            .background(Color(hex: "15B742"))
                            .onTapGesture {
                                viewModel.product = product
                                product.count += 1
                            }
                    }
                    .font(.system(size: 15))
                    .background(Color(hex: "15B742"))
                    .clipShape(Capsule())
                    Spacer()
                    
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
            }
            .overlay(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                VStack {
                    Text(product.totalOldPrice.twoDigits())
                        .font(.system(size: 12))
                        .strikethrough(true,color: .black)
                    Text(product.totalPrice.description)
                        .font(.system(size: 16)).bold()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
    }
}


