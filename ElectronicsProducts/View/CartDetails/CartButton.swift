//
//  CartButton.swift
//  ClassProject
//
//  Created by Consultant on 7/19/23.
//

import SwiftUI

struct CartButton: View {
    var numOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill").resizable().frame(width:30,height: 30)
                .padding(.top,6)
               
            
            if numOfProducts > 0{
                Text("\(numOfProducts)")
                    .font(.caption).bold()
                    .foregroundColor(.white)
                    .frame(width:15,height:20)
                    .background(.red).cornerRadius(20)
            }
        }
        
        
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numOfProducts: 1)
    }
}
