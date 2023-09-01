//
//  urlSessionTest.swift
//  ClassProjectTests
//
//  Created by Consultant on 8/10/23.
//

import Foundation
@testable import ElectronicsProducts

class urlSessionTest:NetworkManagerSessionable{
    
    private var mockData:Data!
    private var mockURLResponse:URLResponse!
    private var error:Error?
    
    func data(for request: URLRequest, delegate: URLSessionDelegate?) async throws -> (Data, URLResponse) {
        
        if error != nil{
            throw error!
        }
        
        return (mockData,mockURLResponse)
        
    }
    
    func setMockData(mockData: Data){
        self.mockData = mockData
        
    }
    
    func setURLResponse(mockURLResponse:URLResponse){
        self.mockURLResponse = mockURLResponse
    }
    
    func setError(error:NetworkError){
        self.error = error
    }
    
    
}
