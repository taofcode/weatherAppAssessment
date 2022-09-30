//
//  MapLocation.swift
//  Assessment
//
//  Created by shelton chiuswa on 28/9/2022.
//

import Foundation
import MapKit

struct MapLocation: Identifiable {
    let id = UUID()
      let name: String
      let latitude: Double
      let longitude: Double
      var coordinate: CLLocationCoordinate2D {
          CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      }
}
