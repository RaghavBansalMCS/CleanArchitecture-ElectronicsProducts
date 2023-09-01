//
//  productsFile.swift
//  ClassProject
//
//  Created by Consultant on 7/18/23.
//

import Foundation

struct ProductsFile: Decodable {
    var products: [Products]
    let total, skip, limit: Int
}

struct Products: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var quantity:Int?

    
 
}

extension ProductsFile{
    static func mockProductsFile() -> [Products]{
        return  [Products(id: 1, title: "iPhone 9", description: "An apple mobile which is nothing like apple", price: 549, discountPercentage: 3.4, rating: 3.6, stock: 4, brand: "Apple", category: "34", thumbnail: "34", images: ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"])]
    }
}

extension ProductsFile{
    static func mockProductsFileWrongData() -> [Products]{
        return  [Products(id: 1, title: "iPhone", description: "An ape mobile which is nothing like apple", price: 59, discountPercentage: 3.4, rating: 3.6, stock: 4, brand: "App", category: "34", thumbnail: "34", images: ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"])]
    }
}



