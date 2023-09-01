//
//  NetworkManager.swift
//  ClassProject
//
//  Created by Consultant on 7/18/23.
//

/*
 SSL Pinning- It is a mechanism used in ios to ensure the autenticity and integrity if server certificates during API Calls
 
 we are adding an extra layer of security to our apps network communication by ensuring that the servers certificate is trusted and
 has not been tampered with
 
 1.Certificate Pinning
 2.Public key Pinning
 */



import Foundation

//- Conforming protocol in NetworkProtocol File
class NetworkManager:NetworkProtocol{
    
    var urlSession: NetworkManagerSessionable
    init(urlSession: NetworkManagerSessionable = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    //- Using function below to parse the urlRequest and get it returned in Data
    func dataFromAPI(urlRequest: Requestable) async throws -> Data {
        
        //- do/catch to  to get the urlRequest in data variable and return to Data else catch
        //- a error and return error if no urlRequest
        do{
            guard let request = urlRequest.createURLRequest() else{
                throw NetworkError.inValidError
            }
            let (data,response) =  try await self.urlSession.data(for: request, delegate: nil)
            if response.invalidURLResponse(){
                return data
            }
            else{
                throw NetworkError.responseError
            }
        }catch{
            
            print(error.localizedDescription)
            throw error
        }
        }
    }

extension URLResponse{
    func invalidURLResponse() -> Bool{
        guard let response = self as? HTTPURLResponse else{
            return false
        }
        switch response.statusCode{
        case 200...299:
            return true
        case 400...499:
            return false
        default:
            return false
        }
    }
}
    

