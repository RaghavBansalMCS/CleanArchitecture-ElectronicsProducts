//
//  ProductsRespository.swift
//  ClassProject
//
//  Created by Consultant on 8/9/23.
//

import Foundation


protocol ProductsRepositoryAction{
    func getProducts() async throws -> ProductsFile
}

class ProductsRepository{
    var networkManager:NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
}

extension ProductsRepository:ProductsRepositoryAction{
    func getProducts() async throws -> ProductsFile {
        do{
            let productsRequest = ProductsRequest(path: API.productsEndPoint)
            let data = try await networkManager.dataFromAPI(urlRequest: productsRequest)
            let results = try JSONDecoder().decode(ProductsFile.self, from: data)
            return results
        }
        catch{
            throw error
        }
    }
    
    
}

