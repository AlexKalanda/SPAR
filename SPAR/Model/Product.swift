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
    var oldPrice: Double
    var lableSale: Bool
    var lableNew: Bool
    var salePercent: Bool
    var count: Int
    var totalPrice: Double {
        Double(priceBig * count)
    }
    var totalOldPrice: Double {
        oldPrice * Double(count)
    }
    
    init(image: String, rating: Double, reviewCount: Int, title: String, country: String, description: Bool, like: Bool, priceBig: Int, priceSmal: Int, oldPrice: Double, lableSale: Bool, lableNew: Bool, salePercent: Bool, count: Int) {
        self.image = image
        self.rating = rating
        self.reviewCount = reviewCount
        self.title = title
        self.country = country
        self.description = description
        self.like = like
        self.priceBig = priceBig
        self.priceSmal = priceSmal
        self.oldPrice = oldPrice
        self.lableSale = lableSale
        self.lableNew = lableNew
        self.salePercent = salePercent
        self.count = count
    }
}

var mocData: [Product] = [
    .init(image: "bread", rating: 4.1, reviewCount: 12, title: "Багет 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 100, priceSmal: 40, oldPrice: 123.40, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "chickenBreast", rating: 4.5, reviewCount: 23, title: "Запеченая грудка куринная", country: "Россия 🇷🇺", description: false, like: false, priceBig: 329, priceSmal: 99, oldPrice: 399.9, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "sausages", rating: 4.7, reviewCount: 45, title: "Купаты свинные 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 280, priceSmal: 50, oldPrice: 379.9, lableSale: true, lableNew: false, salePercent: true, count: 1),
    .init(image: "chickenLegs", rating: 4.3, reviewCount: 13, title: "Куринные ножки 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 229, priceSmal: 10, oldPrice: 299.9, lableSale: false, lableNew: true, salePercent: false, count: 1),
    .init(image: "shashlikChicken", rating: 4.9, reviewCount: 53, title: "Куринный шашлык 500 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 349, priceSmal: 99, oldPrice: 499.9, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "meat", rating: 4.4, reviewCount: 24, title: "Мясо для жарки в маринаде", country: "Россия 🇷🇺", description: false, like: false, priceBig: 429, priceSmal: 99, oldPrice: 499.9, lableSale: true, lableNew: false, salePercent: false, count: 1),
    .init(image: "almond", rating: 4.6, reviewCount: 21, title: "Миндаль 200 г.", country: "Китай 🇨🇳", description: false, like: false, priceBig: 129, priceSmal: 99, oldPrice: 199.9, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "cucumbers", rating: 4.9, reviewCount: 9, title: "Огурцы", country: "Россия 🇷🇺", description: false, like: false, priceBig: 59, priceSmal: 99, oldPrice: 99.9, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "salad", rating: 4.5, reviewCount: 23, title: "Салат 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 119, priceSmal: 99, oldPrice: 199.9, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "pig", rating: 4.5, reviewCount: 13, title: "Свинной шашлык 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 219, priceSmal: 99, oldPrice: 299.9, lableSale: true, lableNew: false, salePercent: false, count: 1),
    .init(image: "steak", rating: 4.8, reviewCount: 32, title: "Стейк 250 г.", country: "Франция 🇫🇷", description: false, like: false, priceBig: 259, priceSmal: 99, oldPrice: 399.9, lableSale: false, lableNew: true, salePercent: false, count: 1),
    .init(image: "turkey", rating: 4.5, reviewCount: 43, title: "Филе индейки 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 219, priceSmal: 99, oldPrice: 369.9, lableSale: true, lableNew: false, salePercent: false, count: 1),
    .init(image: "beef", rating: 4.7, reviewCount: 123, title: "Шашлык гавядина 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 229, priceSmal: 99, oldPrice: 339.9, lableSale: false, lableNew: true, salePercent: false, count: 1),
    .init(image: "shashlikChicken2", rating: 4.8, reviewCount: 163, title: "Шашлык курица 400 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 209, priceSmal: 99, oldPrice: 329.9, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "shashlik", rating: 4.7, reviewCount: 47, title: "Шашлык баранина 500 г.", country: "Россия 🇷🇺", description: false, like: false, priceBig: 329, priceSmal: 99, oldPrice: 439.9, lableSale: false, lableNew: false, salePercent: false, count: 1),
    .init(image: "energetic", rating: 4.9, reviewCount: 56, title: "Энергетический напиток Adrenaline Rush", country: "США 🇺🇸", description: false, like: false, priceBig: 89, priceSmal: 99, oldPrice: 119.9, lableSale: false, lableNew: false, salePercent: false, count: 1)
    
]

enum PickerType: String, CaseIterable {
    case kg = "Кг"
    case thing = "Шт"
}
