//
//  MockRepository.swift
//  ClassProjectTests
//
//  Created by Consultant on 8/10/23.
//

import Foundation

@testable import ElectronicsProducts

class MockRepository:ProductsRepositoryAction{
   
    private var error:NetworkError?
    private var productsMain: ProductsFile?
    private var products:Products?
    
    func getProducts() async throws -> ElectronicsProducts.ProductsFile {
        
        if error != nil{
            throw error!
        }
        return productsMain!
    }
    
    func setProductsFile(list: [Products]){
        self.productsMain = ProductsFile.init(products: list, total: 0, skip: 0, limit: 0)
//        self.productsMain?.products = list
        
    }
    
    func setError(error:NetworkError){
        self.error = error
    }
    
    
    
}
