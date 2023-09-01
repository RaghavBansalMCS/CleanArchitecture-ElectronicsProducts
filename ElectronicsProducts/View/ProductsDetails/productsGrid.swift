//
//  GridHome.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct productsGrid: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var Coordinator:Coordinator
    @StateObject var viewModel = productViewModel(repository: ProductsRepository(networkManager: NetworkManager()))
    @State var HasErrorOccured = false
    var gridColumns = [GridItem(.flexible())]
    @State var index:Int = 0
    var body: some View {
        ScrollView(.horizontal){
                LazyHGrid(rows: gridColumns) {
                  
                    // Even this is a single responsibility as in this switch statment one case will be executed
                    // at a time
                    switch viewModel.viewState{
                    case .loading:
                        ProgressView()
                    case .Empty:
                        EmptyView()
                    case .loaded:
                        gridHomeFunc()
                    case .error:
                        AlertError()
            
                    }
                    
                }.background(Color.white)
                .onAppear{
                    Task {
                            await viewModel.getProductsFromAPI()
                       await getProducts()
                        
                    }
                }
                   .refreshable {
                 await viewModel.getProductsFromAPI()
                      await  getProducts()
                       
                   }
                   .alert(isPresented: $HasErrorOccured) {
                       AlertError() as! Alert
                   }
            
            
            
        }
        }
    
    // This is Single responsibility of the SOLID principles:- where it clearly shows that these functions are only
   // doing specific, single tasks
    
    @ViewBuilder
    func gridHomeFunc() -> some View{
        
        if let products = viewModel.productsMain?.products {
            ForEach(products, id:\.id) { product in
                VStack{
                          NavigationLink() {
                          productDetails(product: product)
                          .environmentObject(cartManager)
                        
                    } label: {
                        productsCell(product: product)
                            .environmentObject(cartManager)
                            
                           
                    }
                    
                }
            }
        } else {
            Text("Opps, didn't work.")
        }
    }
    
    @ViewBuilder
    func AlertError() -> some View{
        Text(viewModel.customError?.errorDescription ?? "Something Went Worng")
    }
    
    func getProducts() async{
            if viewModel.customError != nil{
                HasErrorOccured = true
            }
        }
    }
    



struct GridHome_Previews: PreviewProvider {
    static var previews: some View {
        productsGrid()
            .environmentObject(CartManager())

    }
}
