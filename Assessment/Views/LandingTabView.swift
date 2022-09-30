//
//  LandingTabView.swift
//  Assessment
//
//  Created by shelton chiuswa on 28/9/2022.
//

import Foundation
import SwiftUI

struct LandingTabView: View {
    var locationManger = LocationManager()
    
    
    private enum Tab: Hashable {
        case home
        case favourites
        case map
    
    }
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                }
            FavouriteView()
                .tag(1)
                .tabItem {
                    Text("Favorites")
                    Image(systemName: "allergens")
                }
            MapView()
                .tag(2)
                .tabItem {
                    Text("Map")
                    Image(systemName: "map")
                }
        }
    }
}
