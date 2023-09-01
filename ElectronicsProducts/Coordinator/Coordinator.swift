//
//  Coordinator.swift
//  ClassProject
//
//  Created by Consultant on 8/2/23.
//

import Foundation
import SwiftUI


class Coordinator:ObservableObject{
    
    @Published var path = NavigationPath()
    
    
    func goTotopbar(){
        path.append(MyNavigation.topbar)
    }
    func goTocontentView(){
        path.append(MyNavigation.contenView)
    }
    
    
    func goToproductgrid(){
        path.append(MyNavigation.productgrid)
    }
    
    func goToproductdetails(){
        path.append(MyNavigation.productdetails)
    }
    
    func goTocartView(){
        path.append(MyNavigation.cartView)
    }
    
    func goTohome(){
        path.append(MyNavigation.home)
    }
    
    @ViewBuilder
    func getNavigation(navigation:MyNavigation) -> some View{
        switch navigation {
        case .contenView:
            ContentView()
        case .productgrid:
            productsGrid()
        case .productdetails:
            productDetails( product: Products(id: 0, title: "", description: "", price: 0, discountPercentage: 0.0, rating: 0.0, stock: 0, brand: "", category: "", thumbnail: "", images: ["String"]))
        case .cartView:
            CartView()
        case .home:
            Home()
        case .topbar:
            TopBar()
        
            
        }
        
    }
}

enum MyNavigation: String, CaseIterable, Identifiable{
    
    case contenView
    case productgrid
    case productdetails
    case cartView
    case home
    case topbar
    
    var id:String{
        self.rawValue
    }
    
    
    
}
