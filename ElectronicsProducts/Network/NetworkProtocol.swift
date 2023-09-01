//
//  NetworkProtocol.swift
//  ClassProject
//
//  Created by Consultant on 7/18/23.
//

import Foundation

//-  Protocol for the function where the API is to be parsed
protocol NetworkProtocol{
    func dataFromAPI(urlRequest:Requestable) async throws -> Data
        
}
