//
//  FavouriteViewModel.swift
//  Assessment
//
//  Created by shelton chiuswa on 30/9/2022.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine
class FavouriteViewModel: ObservableObject{
    var locationManager = LocationManager()
    
 
      var dataManager: CoreDataManger
    @State var  tempreture = 0.0
    @State var icon = ""
    @Published var places: [Places] = []
    var data: AnyCancellable?

    var city = ""
    
    init() {
        dataManager = CoreDataManger()
    }
}
extension FavouriteViewModel{
    
    func populateData() ->[Places] {
       dataManager.getAllPlaces()
    }
    func delete(at offsets: IndexSet){
        let places = populateData()
        offsets.forEach{ index in
            let place = places[index]
            dataManager.delete(place: place)
            populateData()
                 
        }
     
    }
    

    func getTempDataIcon(currentWeather: ResponseBody ) {
        tempreture = currentWeather.main!.temp
        icon = (currentWeather.weather?.first?.icon)!
    }
    
    func savePlace(city: String) {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            let lat = placemarks?.first?.location?.coordinate.latitude
            let lon = placemarks?.first?.location?.coordinate.longitude
            
            self.dataManager.save(name: city, latitude: lat!, longitude: lon!)
            
        }
    }
}
