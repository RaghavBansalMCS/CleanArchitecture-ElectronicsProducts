//
//  CartView.swift
//  ClassProject
//
//  Created by Consultant on 7/19/23.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager:CartManager
    @State var loading:Bool = true
    var body: some View {
        ScrollView{
            if cartManager.prod.count > 0 {
                ForEach(cartManager.prod, id: \.id){
                    product in
                    ProductRow(product: product)
                        .environmentObject(cartManager)
                }
                
                
            }
            
            HStack{
                Text("SubTotal: ")
                Spacer()
                Text("$ \(Double(cartManager.total * cartManager.number), specifier: "%.2f")").bold()
            }.padding()
            
            
            HStack{
                Text("Delivery Fees 1%: ")
                Spacer()
                Text("$ \(0.01 * Double(cartManager.total * cartManager.number), specifier: "%.2f")").bold()
            }.padding()
            
            HStack{
                Text("Total is: ")
                Spacer()
                Text("$ \(Double(cartManager.total * cartManager.number) + (0.01 * Double(cartManager.total * cartManager.number)))").bold()
            }.padding()
            }
           
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


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
