//
//  ClassProjectApp.swift
//  ClassProject
//
//  Created by Consultant on 7/17/23.
//

import SwiftUI

@main
struct ElectronicsProductsApp: App {
    var body: some Scene {
        WindowGroup {
            MainPage().environmentObject(Coordinator())
                      .environmentObject(CartManager())
               
        }
    }
}
