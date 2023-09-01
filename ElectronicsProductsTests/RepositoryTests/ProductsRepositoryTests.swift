//
//  ProductsRepositoryTests.swift
//  ClassProjectTests
//
//  Created by Consultant on 8/10/23.
//

import XCTest

@testable import ElectronicsProducts

final class ProductsRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductsWhenWeExpectDataRecievedThanError() async throws {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        let respositoryObject = ProductsRepository(networkManager: fakeNetworkManager)
        
        //when
        fakeNetworkManager.mockPath = "TestAPI"
        let output = try await respositoryObject.getProducts()
        
//        OR
//        let ProductsFile = try await respositoryObject.getProducts()
//
        
        //Then
        XCTAssertNotNil(respositoryObject)
        XCTAssertNotNil(fakeNetworkManager)
        XCTAssertEqual(output.products.count, 30)
        
//        OR
//        XCTAssertEqual(ProductsFile.products.count, 30)
        
    }
    
    
    
    func testProductsWhenNODataIsThere() async throws{
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        let respositoryObject = ProductsRepository(networkManager: fakeNetworkManager)
        
        //when
        fakeNetworkManager.mockPath = "TestAPIEmpty"
        
        do{
            let output = try await respositoryObject.getProducts()
            
            //        OR
            //        let ProductsFile = try await respositoryObject.getProducts()
            //
            
            //Then
            XCTAssertNotNil(respositoryObject)
            XCTAssertNotNil(fakeNetworkManager)
            XCTAssertEqual(output.products.count, 0)
            
            //        OR
            //        XCTAssertEqual(ProductsFile.products.count, 30)
        }catch{
            XCTAssertNotNil(Error.self)
        }
    }
    
    func testProductsWhenNODataIsThereButParsingError() async throws{
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        let respositoryObject = ProductsRepository(networkManager: fakeNetworkManager)
        
        //when
        fakeNetworkManager.mockPath = "TestAPIIncorrectData"
        
        do{
            let output = try await respositoryObject.getProducts()
            
            //        OR
            //        let ProductsFile = try await respositoryObject.getProducts()
            //
            
            //Then
            XCTAssertNotNil(respositoryObject)
            XCTAssertNotNil(fakeNetworkManager)
            XCTAssertEqual(output.products.count, 0)
            
            //        OR
            //        XCTAssertEqual(ProductsFile.products.count, 30)
        }catch{
            XCTAssertNotNil(Error.self)
            XCTAssertNotNil(NetworkError.inValidError)
        }
    }
    
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
