//
//  ViewModel.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var products: [Product]
    @Published var product: Product = .init(image: "bread", rating: 4.1, reviewCount: 12, title: "Багет 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 100, priceSmal: 40, oldPrice: 123.40, lableSale: false, lableNew: false, salePercent: false, count: 1)
    @Published var trash = [Product]()

    init() {
        self.products = mocData
    }
    
    
    func addProductTrash(_ product: Product) {
        trash.append(product)
    }
    
    func deleteProductTrash(_ product: Product) {
        for (index, product) in trash.enumerated() {
            if self.product.id == product.id {
                trash.remove(at: index)
            }
        }
    }
    
    
    
}
