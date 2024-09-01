//
//  Prod.swift
//  SPAR
//
//  Created by admin on 28/8/2024.
//

import Foundation

class Product: Identifiable {
    let id = UUID().uuidString
    let image: String
    var rating: Double
    var reviewCount : Int
    let title: String
    let country: String
    var description: Bool
    var like: Bool
    var priceBig: Int
    var priceSmal: Int
    var price: Double
    var oldPrice: Double
    var lableSale: Bool
    var lableNew: Bool
    var salePercent: Bool
    var count: Int
    var totalPrice: Double {
        price * Double(count)
    }
    var totalOldPrice: Double {
        oldPrice * Double(count)
    }
    
    var trash: Bool
    
    init(image: String, rating: Double, reviewCount: Int, title: String, country: String, description: Bool, like: Bool, priceBig: Int, priceSmal: Int, price: Double, oldPrice: Double, lableSale: Bool, lableNew: Bool, salePercent: Bool, count: Int, trash: Bool) {
        self.image = image
        self.rating = rating
        self.reviewCount = reviewCount
        self.title = title
        self.country = country
        self.description = description
        self.like = like
        self.priceBig = priceBig
        self.priceSmal = priceSmal
        self.price = price
        self.oldPrice = oldPrice
        self.lableSale = lableSale
        self.lableNew = lableNew
        self.salePercent = salePercent
        self.count = count
        self.trash = trash
    }
}

var mocData: [Product] = [
    .init(image: "bread", rating: 4.1, reviewCount: 12, title: "Багет 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 100, priceSmal: 40, price: 100.40, oldPrice: 123.40, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "chickenBreast", rating: 4.5, reviewCount: 23, title: "Запеченая грудка куринная", country: "Россия 🇷🇺", description: false, like: false, priceBig: 329, priceSmal: 99, price: 329.99, oldPrice: 399.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "sausages", rating: 4.7, reviewCount: 45, title: "Купаты свинные 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 280, priceSmal: 50, price: 280.50, oldPrice: 379.9, lableSale: true, lableNew: false, salePercent: true, count: 1, trash: false),
    .init(image: "chickenLegs", rating: 4.3, reviewCount: 13, title: "Куринные ножки 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 229, priceSmal: 10, price: 229.10, oldPrice: 299.9, lableSale: false, lableNew: true, salePercent: false, count: 1, trash: false),
    .init(image: "shashlikChicken", rating: 4.9, reviewCount: 53, title: "Куринный шашлык 500 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 349, priceSmal: 99, price: 349.99, oldPrice: 499.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "meat", rating: 4.4, reviewCount: 24, title: "Мясо для жарки в маринаде", country: "Россия 🇷🇺", description: false, like: false, priceBig: 429, priceSmal: 99, price: 429.99, oldPrice: 499.9, lableSale: true, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "almond", rating: 4.6, reviewCount: 21, title: "Миндаль 200 г.", country: "Китай 🇨🇳", description: false, like: false, priceBig: 129, priceSmal: 99, price: 129.99, oldPrice: 199.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "cucumbers", rating: 4.9, reviewCount: 9, title: "Огурцы", country: "Россия 🇷🇺", description: false, like: false, priceBig: 59, priceSmal: 99, price: 59.99, oldPrice: 99.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "salad", rating: 4.5, reviewCount: 23, title: "Салат 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 119, priceSmal: 99, price: 119.99, oldPrice: 199.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "pig", rating: 4.5, reviewCount: 13, title: "Свинной шашлык 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 219, priceSmal: 99, price: 219.99, oldPrice: 299.9, lableSale: true, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "steak", rating: 4.8, reviewCount: 32, title: "Стейк 250 г.", country: "Франция 🇫🇷", description: false, like: false, priceBig: 259, priceSmal: 99, price: 259.99, oldPrice: 399.9, lableSale: false, lableNew: true, salePercent: false, count: 1, trash: false),
    .init(image: "turkey", rating: 4.5, reviewCount: 43, title: "Филе индейки 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 219, priceSmal: 99, price: 219.99, oldPrice: 369.9, lableSale: true, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "beef", rating: 4.7, reviewCount: 123, title: "Шашлык гавядина 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 229, priceSmal: 99, price: 229.99, oldPrice: 339.9, lableSale: false, lableNew: true, salePercent: false, count: 1, trash: false),
    .init(image: "shashlikChicken2", rating: 4.8, reviewCount: 163, title: "Шашлык курица 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 209, priceSmal: 99, price: 209.99, oldPrice: 329.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "shashlik", rating: 4.7, reviewCount: 47, title: "Шашлык баранина 500 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 329, priceSmal: 99, price: 329.99, oldPrice: 439.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false),
    .init(image: "energetic", rating: 4.9, reviewCount: 56, title: "Энергетический напиток Adrenaline Rush", country: "США 🇺🇸", description: false, like: false, priceBig: 89, priceSmal: 99, price: 89.99, oldPrice: 119.9, lableSale: false, lableNew: false, salePercent: false, count: 1, trash: false)
    
]

enum PickerType: String, CaseIterable {
    case kg = "Кг"
    case thing = "Шт"
}
