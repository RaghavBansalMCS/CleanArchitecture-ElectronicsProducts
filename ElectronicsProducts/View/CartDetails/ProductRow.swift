//
//  ProductRow.swift
//  ClassProject
//
//  Created by Consultant on 7/19/23.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartManager:CartManager
    @State var number:Int = 0
    var product: Products
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: product.images[0])) { Image in
                Image.resizable().frame(width:80,height:70).cornerRadius(10).padding()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
            } placeholder: {
                ProgressView()
                
            }
            VStack(alignment: .leading, spacing:10){
                Text("Brand:  \(product.brand)").bold().font(.caption)
                Text("Price:  $\(product.price)").bold().font(.caption)
                
            }.padding(0)
            Spacer()
            
            HStack{
                //Stepper
                
                Button{
                    if(cartManager.prod.count > 0){
                        number -= 1
                        cartManager.number = number
                    }
                   
    
                }label:{
                    Image(systemName: "minus")
                        .font(.system(size:16, weight: .heavy))
                        .foregroundColor(.black)

                }
                Text("\(cartManager.number)")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.horizontal,5)
                    .background(Color.black.opacity(0.06))
                    
                
                Button{
                    number += 1
                    cartManager.number = number
                }
            label:{
                    Image(systemName: "plus")
                        .font(.system(size:16, weight: .heavy))
                        .foregroundColor(.black)

                }
                
               
            }.padding().border(.black).cornerRadius(10)
            
            Image(systemName: "trash.fill")
                .onTapGesture {
                    cartManager.RemoveFromCart(prodMain: product)
                    cartManager.number = 0
                    cartManager.buttonTapped = false

                }.padding()

            
        }
        
        
        
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        
       
        
        ProductRow(product: Products(id: 1, title: "iPhone 9", description: "An apple mobile which is nothing like apple", price: 549, discountPercentage: 3.4, rating: 3.6, stock: 4, brand: "Apple", category: "34", thumbnail: "34", images: ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"], quantity: 0)).environmentObject(CartManager() )
            
    }
}
