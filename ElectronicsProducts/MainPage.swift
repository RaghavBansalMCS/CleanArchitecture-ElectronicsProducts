//
//  MainPage.swift
//  ClassProject
//
//  Created by Consultant on 8/2/23.
//

import SwiftUI

struct MainPage: View {
    @EnvironmentObject var coordinator:Coordinator
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getNavigation(navigation:.contenView)
            
                .navigationDestination(for: MyNavigation.self) { navigation in
                    coordinator.getNavigation(navigation:navigation)
                }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
