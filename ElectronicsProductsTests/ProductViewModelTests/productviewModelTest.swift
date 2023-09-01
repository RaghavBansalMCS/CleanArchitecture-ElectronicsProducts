//
//  productviewModelTest.swift
//  ClassProjectTests
//
//  Created by Consultant on 7/19/23.
//

import XCTest
@testable import ElectronicsProducts

final class productviewModelTest: XCTestCase {
    
    var productModel: productViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
    
    func testingwithTheData() async throws{
        
        let mockRepository = MockRepository()
        productModel = await productViewModel(repository: mockRepository)
        
        
        mockRepository.setProductsFile(list: ProductsFile.mockProductsFile())
        await productModel.getProductsFromAPI()
        
        
        XCTAssertNotNil(productModel)
        
        let output = await productModel.productsMain?.products
        XCTAssertEqual(output?.count, 1)
        
//        let error = await productModel.customError
//        XCTAssertNil(error)
        
        let product = output?.first
        XCTAssertEqual(product?.brand, "Apple")
        XCTAssertEqual(product?.description, "An apple mobile which is nothing like apple")
        XCTAssertEqual(product?.price, 549)
        
    }
    
    
    func testingwithTheDataWhenInvalid() async throws{
        
        let mockRepository = MockRepository()
        productModel = await productViewModel(repository: mockRepository)
        
        
        mockRepository.setError(error: NetworkError.inValidError)
        await productModel.getProductsFromAPI()
        
        
        XCTAssertNotNil(productModel)
        
        let output = await productModel.productsMain?.products
        XCTAssertEqual(output?.count, nil)
        

        let product = output?.first
        XCTAssertNil(product)
        
        let error = await productModel.customError
        XCTAssertEqual(error, NetworkError.inValidError)
       
        
    }
    
    func testingwithTheDataWhenitsnotcorrect() async throws{
        
        let mockRepository = MockRepository()
        productModel = await productViewModel(repository: mockRepository)
        
        
        mockRepository.setProductsFile(list: ProductsFile.mockProductsFileWrongData())
        await productModel.getProductsFromAPI()
        
        
        XCTAssertNotNil(productModel)
        
        let output = await productModel.productsMain?.products
        XCTAssertEqual(output?.count, 1)
        
        let error = await productModel.customError
        XCTAssertNil(error)
        
        let product = output?.first
        XCTAssertNotEqual(product?.brand, "Apple")
        XCTAssertNotEqual(product?.description, "An apple mobile which is nothing like apple")
        XCTAssertNotEqual(product?.price, 549)
        
    }
    
    func testingwithTheDataWhenError() async throws{
        
        let mockRepository = MockRepository()
        productModel = await productViewModel(repository: mockRepository)
        
        
        mockRepository.setError(error: NetworkError.doNotFoundError)
        await productModel.getProductsFromAPI()
        
        
        XCTAssertNotNil(productModel)
        
        let output = await productModel.productsMain?.products
        XCTAssertEqual(output?.count, nil)
        

        let product = output?.first
        XCTAssertNil(product)
        
        let error = await productModel.customError
        XCTAssertEqual(error, NetworkError.doNotFoundError)
       
        
    }
    

    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
