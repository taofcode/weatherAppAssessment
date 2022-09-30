//
//  MapViewModel.swift
//  Assessment
//
//  Created by shelton chiuswa on 28/9/2022.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

class MapViewModel: ObservableObject{
    
    var locationManager = LocationManager()
    var coreData = CoreDataManger()
    
    
    init() {
        
    }
    
    func retrievePlaces() ->[Places] {
    
        let places  = coreData.getAllPlaces()
        return places
        
    }

    
    
    
    
    
    
}

