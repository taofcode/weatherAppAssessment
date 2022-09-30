//
//  MapView.swift
//  Assessment
//
//  Created by shelton chiuswa on 28/9/2022.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation
struct MapView: View {

    

    @ObservedObject var viewModel = MapViewModel()
    @ObservedObject private var locationManager = LocationManager()

    var body: some View {
       
        Map(coordinateRegion: $locationManager.region ,annotationItems: viewModel.retrievePlaces()) { location in
         
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude:location.longitude)) {
                Image(systemName: "pin.fill")
                    .frame(width: 90, height: 90)
                    .foregroundColor(Color.red)
                    .onTapGesture {
                        print("Tapped on \(String(describing: location.name))")
                    }
            }
          }
          .padding()
     
    
    }
}

