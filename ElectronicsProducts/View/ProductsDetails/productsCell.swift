//
//  Products.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct productsCell: View {
   @EnvironmentObject var cartManager: CartManager
    var product:Products
    @State var buttonTapped = false
    
    var gridRows = [GridItem(.flexible())]
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20).fill(.white)
                .overlay{
                    VStack{
                        ScrollView(.horizontal){
                            LazyHGrid(rows: gridRows) {
                                ForEach(product.images, id:\.self){ img in
                                    AsyncImage(url: URL(string: img)) { Image in
                                        Image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                    } placeholder: {
                                        ProgressView()
                                        
                                    }
                                }
                            }
                        }

                        HStack{
                            VStack(alignment: .leading){
                                Text(product.brand).bold()
                                
                            }
                            Spacer()
                            
                            Button{
                                buttonTapped.toggle()
                                cartManager.addToCart(prodMain: product)
                                cartManager.number = 1
                               
                               
                            }label:{
                                Image(systemName: "plus").background(Color.black).cornerRadius(4)
                                    .foregroundColor(.white)
                            }
                            .disabled(buttonTapped)
                            
                            
                        }.padding(20)
                        
                        
                        Text(product.description).font(.caption).padding(0)
                        Text("$\(product.price)").bold().padding(10)
                        
                        
                    }
                   
                }
                .frame(width: 230,height: 210)
            
        }
        
        
        
      
    }
}

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        productsCell(product: Products(id: 1, title: "iPhone 9", description: "An apple mobile which is nothing like apple", price: 549, discountPercentage: 3.4, rating: 3.6, stock: 4, brand: "Apple", category: "34", thumbnail: "34", images: ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"], quantity: 0))
            .environmentObject(CartManager())
    }
}
