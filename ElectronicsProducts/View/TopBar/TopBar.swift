//
//  GridTopBar.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct TopBar: View {
    @StateObject var viewModel = productViewModel(repository: ProductsRepository(networkManager: NetworkManager()))
    var gridColumns = [GridItem(.flexible())]
    @EnvironmentObject var coordinator:Coordinator
    var body: some View {
        ScrollView(.horizontal){
                LazyHGrid(rows: gridColumns) {
                    if let products = viewModel.productsMain?.products {
                        ForEach(products, id:\.id) { product in
                            VStack{
                                Button {
                                    coordinator.goToproductdetails()
                                } label: {
                                    TopBarCell(product: product)
                                }
                                
                            }
                        }
                    }
                    else{
                        Text("fnfjf")
                    }
                }.background(Color.white)
                .task {
                    await viewModel.getProductsFromAPI()
                }
            
        }
    }
}

struct GridTopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
