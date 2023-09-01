//
//  CartManager.swift
//  ClassProject
//
//  Created by Consultant on 7/19/23.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published  var prod:[Products] = []
    @Published  var total: Int = 0
    @Published  var number:Int = 0
    @Published  var buttonTapped = false
    
    
    
   
   
    
    
    func addToCart(prodMain:Products){
         
        prod.append(prodMain)
        total = total + prodMain.price
        
    }
    
    func RemoveFromCart(prodMain:Products){
        prod = prod.filter {$0.id != prodMain.id}
        if total > 0{
            total = total - prodMain.price 
        }else{
            total = 0
        }
        
    }
    
}
