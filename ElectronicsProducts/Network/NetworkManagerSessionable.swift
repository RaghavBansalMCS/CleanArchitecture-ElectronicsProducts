//
//  NetworkManagerSessionable.swift
//  ClassProject
//
//  Created by Consultant on 8/9/23.
//

import Foundation

protocol NetworkManagerSessionable{
    func data(for request:URLRequest, delegate:URLSessionDelegate?) async throws -> (Data, URLResponse)
    
}

extension URLSession:NetworkManagerSessionable{
    func data(for request: URLRequest, delegate: URLSessionDelegate?) async throws -> (Data, URLResponse) {
        // URLSession.shared = self
        try await self.data(for: request)
      
    }
    
    
}
