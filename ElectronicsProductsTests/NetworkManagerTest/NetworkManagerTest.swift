//
//  NetworkManagerTest.swift
//  ClassProjectTests
//
//  Created by Consultant on 8/10/23.
//

import XCTest
@testable import ElectronicsProducts

final class NetworkManagerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkManagerFunction() async throws {
         //Given
        let mockUrlSession = urlSessionTest()
        let networkManager = NetworkManager(urlSession: mockUrlSession)
        
        //When
        do{
            let dummyData = "SomeDummyTestData".data(using: .utf8)
            mockUrlSession.setMockData(mockData: dummyData!)
            
            
            let urlResponse = HTTPURLResponse(url: URL(string:"test")!, statusCode: 200, httpVersion: nil, headerFields: nil)
            mockUrlSession.setURLResponse(mockURLResponse: urlResponse!)
            
            let data = try await networkManager.dataFromAPI(urlRequest: ProductsRequest(path: "fffffffffff"))
            
            //Then
            XCTAssertNotNil(data)
        }catch{
            XCTAssertNil(error)
        }
    }
    
    func testNetworkManagerFunction1() async throws {
         //Given
        let mockUrlSession = urlSessionTest()
        let networkManager = NetworkManager(urlSession: mockUrlSession)
        
        //When
        do{
            let dummyData = "SomeDummyTestData".data(using: .utf8)
            mockUrlSession.setMockData(mockData: dummyData!)
            
            
            let urlResponse = HTTPURLResponse(url: URL(string:"test")!, statusCode: 400, httpVersion: nil, headerFields: nil)
            mockUrlSession.setURLResponse(mockURLResponse: urlResponse!)
            
            let data = try await networkManager.dataFromAPI(urlRequest: ProductsRequest(path: "fffffffffff"))
            
            //Then
            XCTAssertNil(data)
        }catch{
            XCTAssertNotNil(error)
        }
    }
    func testNetworkManagerFunctionResponseError() async throws {
         //Given
        let mockUrlSession = urlSessionTest()
        let networkManager = NetworkManager(urlSession: mockUrlSession)
        
        //When
        do{
            let dummyData = "SomeDummyTestData".data(using: .utf8)
            mockUrlSession.setMockData(mockData: dummyData!)
            
            
            let urlResponse = HTTPURLResponse(url: URL(string:"test")!, statusCode: 400, httpVersion: nil, headerFields: nil)
            mockUrlSession.setURLResponse(mockURLResponse: urlResponse!)
            
            let data = try await networkManager.dataFromAPI(urlRequest: ProductsRequest(path: "fffffffffff"))
            
            //Then
            XCTAssertNil(data)
        }catch{
            XCTAssertEqual(error as! NetworkError, NetworkError.responseError)
        }
    }
    
    func testNetworkManagerFunctioninvalidPathError() async throws {
         //Given
        let mockUrlSession = urlSessionTest()
        let networkManager = NetworkManager(urlSession: mockUrlSession)
        
        //When
        do{
            let data = try await networkManager.dataFromAPI(urlRequest: ProductsRequest(path: ""))
            
            //Then
            XCTAssertNil(data)
        }catch{
            XCTAssertEqual(error as! NetworkError, NetworkError.inValidError)
        }
    }
    
    func testNetworkManagerFunctionError3() async throws {
         //Given
        let mockUrlSession = urlSessionTest()
        let networkManager = NetworkManager(urlSession: mockUrlSession)
        
        //When
        do{
            mockUrlSession.setError(error: NetworkError.doNotFoundError)
            let _ = try await networkManager.dataFromAPI(urlRequest: ProductsRequest(path: "test"))
            //Then
        }catch{
            XCTAssertEqual(error as! NetworkError, NetworkError.doNotFoundError)
        }
    }

    
    
    
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
