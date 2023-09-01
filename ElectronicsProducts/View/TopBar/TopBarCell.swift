//
//  productTopbar.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct TopBarCell: View {
    var product:Products
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20).fill(.white)
                .overlay{
                    HStack{
//                        ForEach(product.images, id:\.self){ img in
//                            Image(img) .resizable().scaledToFit()
//                        }
                        AsyncImage(url: URL(string: product.images[0])) { Image in
                            Image.resizable()
                                .aspectRatio(contentMode: .fit).cornerRadius(40)
                        } placeholder: {
                            ProgressView()
                            
                        }
                        Text(product.brand).bold()
                        
                         
                        
                           
                        
                        
                        
                    }
                }.frame(width: 190,height: 60)
        }
    }
}

struct productTopbar_Previews: PreviewProvider {
    static var previews: some View {
        TopBarCell(product: Products(id: 4, title: "34", description: "56", price: 4, discountPercentage: 4.5, rating: 6.7, stock: 4, brand: "iphone 9", category: "String", thumbnail: "String", images: ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"], quantity: 0))
    }
}
