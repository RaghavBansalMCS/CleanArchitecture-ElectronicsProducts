//
//  FakeNetworkManager.swift
//  ClassProjectTests
//
//  Created by Consultant on 7/19/23.
//

import Foundation
@testable import ElectronicsProducts
//- Conforming protocol in NetworkProtocol File
class FakeNetworkManager: NetworkProtocol {
    
    //mocking
    var mockPath = ""
    
    
    func dataFromAPI(urlRequest: ElectronicsProducts.Requestable) async throws -> Data {
        let bundle = Bundle(for: FakeNetworkManager.self)
       
        guard let url = bundle.url(forResource: mockPath, withExtension: "json") else{
            throw NetworkError.inValidError
        }
           do{
               let data = try Data(contentsOf: url)
               return data
               }catch{
               print(error.localizedDescription)
                   throw error
                   
               }
    }
    
    
    }
