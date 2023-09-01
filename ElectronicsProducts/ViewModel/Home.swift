//
//  Home.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var Coordinator:Coordinator
    @State private var searchText = ""
    @State var loading:Bool = true
    
    var body: some View {
      
//            NavigationStack{
                VStack{
                    
                    List{
                        Section(){
                            HStack{
                                Image(systemName: "magnifyingglass.circle.fill").resizable().frame(width: 55,height: 55).cornerRadius(10)
                                
                                TopBar()
                                
                            }
                            
                        }
                        Section("Hot Sales"){
                            productsGrid()
                                .environmentObject(cartManager)
                        }.bold()
                        Section("Recently Viewed"){
                            
                            productsGrid()
                                .environmentObject(cartManager)
                            
                            
                        }.bold()
                    }.background(Color.white)
                }
                
                .toolbar {
                    Button{
                        Coordinator.goTocartView()
//                        NavigationLink{
//                        CartView()
//                            .environmentObject(cartManager)
                        
                    } label: {
                        CartButton(numOfProducts: cartManager.prod.count).frame(width:40)
                    }
                    
                    
                }
                
                
                
                
                
                
//            }.navigationTitle("Grid View")
//                .navigationBarTitleDisplayMode(.inline)
//                .searchable(text: $searchText, prompt: "Search")
//                .background(Color.white)
            
                .redacted(reason: loading ? .placeholder: [])
            
                .onAppear(){
                    Task{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            loading = false
                        }
                    }
            }
            
            
            
        
    }
    
  
    
    
        
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(CartManager())
    }
}
