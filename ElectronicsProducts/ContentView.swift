//
//  ContentView.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager:CartManager
    var body: some View {
           
        
            TabView{
                Home().tabItem {
                    Image(systemName: "homekit")
                    Text("Home")
                }

                
            }
        
           
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
