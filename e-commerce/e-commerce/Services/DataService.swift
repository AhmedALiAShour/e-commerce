//
//  DataService.swift
//  e-commerce
//
//  Created by ahmed on 6/27/18.
//  Copyright © 2018 Organization. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    private let hats = [
        Product(title: "Developes Logo Graphic Hats", price: "$25", imageName: "hat01.png"),
        Product(title: "Developes Logo Graphic Hats", price: "$25", imageName: "hat02.png"),
        Product(title: "Developes Logo Graphic Hats", price: "$25", imageName: "hat03.png"),
        Product(title: "Developes Logo Graphic Hats", price: "$25", imageName: "hat04.png")
    ]
    
    private let hoodies = [
        Product(title: "Developes Logo Graphic hoodies", price: "$25", imageName: "hoodie01.png"),
        Product(title: "Developes Logo Graphic hoodies", price: "$25", imageName: "hoodie02.png"),
        Product(title: "Developes Logo Graphic hoodies", price: "$25", imageName: "hoodie03.png"),
        Product(title: "Developes Logo Graphic hoodies", price: "$25", imageName: "hoodie04.png")
    ]
    
    private let shirts = [
        Product(title: "Developes Logo Graphic shirts", price: "$25", imageName: "shirt01.png"),
        Product(title: "Developes Logo Graphic shirts", price: "$25", imageName: "shirt02.png"),
        Product(title: "Developes Logo Graphic shirts", price: "$25", imageName: "shirt03.png"),
        Product(title: "Developes Logo Graphic shirts", price: "$25", imageName: "shirt04.png"),
        Product(title: "Developes Logo Graphic shirts", price: "$25", imageName: "shirt05.png")
    ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProducts(forCategoryTitle title:String) -> [Product]{
        switch title {
        case "SHIRTS":
            return getShirts()
        
        case "HATS":
            return getHats()
            
        case "HOODIES":
            return getHoodies()
            
        case "DIGITAL":
            return getDigitalGoods()
            
        default:
            return getShirts()
        }
    }
    
    func getShirts() -> [Product] {
        return shirts
    }
    
    func getHats() -> [Product] {
        return hats
    }
    
    func getHoodies() -> [Product] {
        return hoodies
    }
    
    func getDigitalGoods() -> [Product] {
        return digitalGoods
    }
}
