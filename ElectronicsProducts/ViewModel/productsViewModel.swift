//
//  productsViewModel.swift
//  ClassProject
//
//  Created by Consultant on 7/18/23.
//

/*
 Repository Pattern:-
 - It provides an abstraction layer between the data storage (API/Core Data) and the Rest of Application
 - it  decouples the data logic from the business logic
 
 Clean Architecture:-
 Its like a onion architecture which has a new layer inside the outer layer
 All business logic is at the center of the clean architecture
 
 Entities:- This is our business logic and at the center of this architecuture
 Use Cases(Interactor):-  This will contain the rules or flow of data between entities. Eg of Interactor is respository
 Interface Adaptor:- This includes the presenters, controllers and viewModels
 Framework and Drivers:- UI, database, webservice, analytics and all external third party frameworks
 
 
 SOLID Principles
 S- Single Responsibility:- It states that, any task or  class should  only do one task
 
 O- Open Close Principle:- Open for extension but closed for modifications
 
 L- Liskov Substitute Principle:- Derived class Objects should be easily replaceble with derived or child class object
 
 I- Interface Segregation:- clients should not be forced to depend upon interfaces they  don't require, instead of having one big protocol, divide it into small protocols
 
 D- Dependancy Inversion:- Different parts of the code shouldn't depend upon concrete classes
 
 */



import Foundation

enum ViewState{
    case loading
    case error
    case loaded
    case Empty
}

@MainActor
class productViewModel: ObservableObject {
    
    @Published var productsMain: ProductsFile?
    @Published var customError: NetworkError?
    @Published private(set) var viewState:ViewState = .loaded
    
    var repository:ProductsRepositoryAction
    
    init(repository: ProductsRepositoryAction) {
        self.repository = repository
    }
    
    func getProductsFromAPI() async{
        viewState = .loading
        do{
            self.productsMain =  try await self.repository.getProducts()
            if self.productsMain?.products.count == 0{
                viewState = .Empty
            }else{
                print(self.productsMain ?? "ffffff")
                viewState = .loaded
            }
        }catch let error{
            viewState = .error
            print(error.localizedDescription)
            switch error{
            case is DecodingError:
                customError = NetworkError.parsingError
                
            case NetworkError.doNotFoundError:
                customError = NetworkError.doNotFoundError
                
            case NetworkError.inValidError:
                customError = NetworkError.inValidError
                
            default:
                customError = NetworkError.doNotFoundError
            }
            
            
        }
        }
    }


extension productViewModel{
//    This represents the second principle which is Open Close principle:- which states that in a class to add more features, the
//    class must extended using "extension" but shouldn't  be modified on the existing functionality
    
    // This is an example, where in this class "productViewModel", to make any changes it be done using extension and shall not make
    // any changes in the existing functionality
}


class Parent{
    
}

class child:Parent{
    
}

let P = Parent()

// In the Liskov substitute principle, The parent class object shall be easily used instead of child class object or vice versa

