//
//  ViewModel.swift
//  SPAR
//
//  Created by admin on 25/8/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var products: [Product]
    @Published var product: Product = .init(image: "bread", rating: 4.1, reviewCount: 12, title: "Багет 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 100, priceSmal: 40, price: 100.40, oldPrice: 123.40, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false)
    @Published var trash = [Product]()
    @Published var likes = [Product]()
    @Published var isTapButton = true
    
    
    init() {
        self.products = mocData
    }
    
    
    func addProductTrash(_ product: Product) {
        trash.append(product)
    }
    
    func addProductLikes(_ product: Product) {
        likes.append(product)
    }
    
    func deleteProductLikes(_ product: Product) {
        for (index,product) in likes.enumerated() {
            if self.product.id == product.id {
                likes.remove(at: index)
            }
        }
    }
    
    func checkProductLike(_ product: Product) -> Bool {
        var res: Bool = false
        for product in likes {
            if self.product.id == product.id {
                res = true
            } else {
                res = false
            }
        }
        return res
    }
    
    func deleteProductTrash(_ product: Product) {
        for (index, product) in trash.enumerated() {
            if self.product.id == product.id {
                trash.remove(at: index)
            }
        }
    }
    
    func totalPrrice() -> Double {
        let res = trash.map { $0.totalPrice }
        return res.reduce(0, +)
    }
    
    //сделать корректно
    func deleteSwipe(_ product: Product) {
        for (index, product) in trash.enumerated() {
            if self.product.id == product.id {
                trash.remove(at: index)
            }
        }
    }
    
    
    
}
