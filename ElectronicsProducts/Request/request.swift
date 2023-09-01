//
//  Request.swift
//  ClassProject
//
//  Created by Consultant on 8/9/23.
//

import Foundation

protocol Requestable{
    var productsAPI: String{get}
    var path: String{get}
    var type: String{get} // get, put, post, delete
    var header: [String:String]{get}
    var params: [String:String]{get}
    
    func createURLRequest() ->URLRequest?
}

extension Requestable{
    var productsAPI: String{
        return API.productsAPI
    }
    
    var type: String{ // get, put, post, delete
        return ""
    }
    var header: [String:String]{
        return [:]
    }
    var params: [String:String]{
        return [:]
    }
    
    func createURLRequest() -> URLRequest?{
        guard productsAPI.count > 0 , path.count > 0 else{
            return nil
        }
        
        var urlComponents =  URLComponents(string: productsAPI + path)
        var queryitems:[URLQueryItem] = []
        
        for(key, value) in params{
            queryitems.append(URLQueryItem(name: key, value: value))
        }
        
        urlComponents?.queryItems = queryitems
        
        guard let url = urlComponents?.url else {return nil}
        return URLRequest(url: url)
    }
}

