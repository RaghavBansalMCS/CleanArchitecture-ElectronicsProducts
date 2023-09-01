//
//  productDetails.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct productDetails: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var Coordinator:Coordinator
    var product:Products
    var gridColumns = [GridItem(.flexible())]
    @State var loading:Bool = true
    
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                LazyHGrid(rows: gridColumns) {
                    
                    ForEach(product.images, id:\.self){ img in
                        AsyncImage(url: URL(string: img)) { Image in
                            Image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                            
                        }
                    }
                    
                    
                    
                }.frame(height:200)
                
            }.frame(width:380, height:200)
            
                .cornerRadius(20)
            
            
            
            HStack{
                Text("Free Shipping").font(.title2).bold()
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent).padding()
                    .background(Color.black).cornerRadius(30)
                Spacer()
                Image(systemName: "heart.circle").resizable().scaledToFit().frame(width:50,height:80).padding()
                
                
            }.padding(-5)
            
            
            Text(product.brand).bold().font(.largeTitle).padding()
            Text(product.description).font(.body).padding(20)
            Text("  $\(product.price).00").font(.largeTitle).padding()
            HStack{
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                }
                label: {
                    Text("Continue").bold().font(.largeTitle).foregroundColor(.white)
                        .buttonStyle(.borderedProminent).padding().frame(width:200,height:50)
                        .background(Color.black).cornerRadius(40).padding()
                }

                
                HStack{
                    //Stepper
                    
                    Button(action:{
                        if cartManager.prod.count > 0{
                            cartManager.number  -= 1
                        }
                       
                    }){
                        Image(systemName: "minus")
                            .font(.system(size:16, weight: .heavy))
                            .foregroundColor(.black)
                        
                    }
                    Text("\(cartManager.number) ")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.horizontal,5)
                        .background(Color.black.opacity(0.06)).frame(width:30, height:30)
                    
                    
                    Button(action:{
                        cartManager.number  += 1
                    }
                    ){
                        Image(systemName: "plus")
                            .font(.system(size:16, weight: .heavy))
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }.padding().border(.black).cornerRadius(10)
                Spacer()
                
                
            }.padding()
            Spacer()
            
        }.padding(10)
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


struct productDetails_Previews: PreviewProvider {
    static var previews: some View {
        productDetails(product: Products(id: 1, title: "iPhone 9", description: "An apple mobile which is nothing like apple", price: 549, discountPercentage: 3.4, rating: 3.6, stock: 4, brand: "Apple", category: "34", thumbnail: "34", images: ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"], quantity: 0) )
            .environmentObject(CartManager())
    }
}
