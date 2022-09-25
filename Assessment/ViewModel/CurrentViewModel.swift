//
//  CurrentViewModel.swift
//  Assessment
//
//  Created by shelton chiuswa on 21/9/2022.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import CoreLocation

class CurrentViewModel: ObservableObject{
    
    @Published var currentWeather: ResponseBody = ResponseBody()
    
    
    var data: AnyCancellable?
    @Published var indicator = true

    
    var locationManager = LocationManager()
    
    init() {

        getCurrentWeather(lat: locationManager.lastLocation?.coordinate.latitude ?? 0.0,
                          lon: locationManager.lastLocation?.coordinate.longitude ?? 0.0)
    }
}

extension CurrentViewModel{
    func Header()-> String{
           
           var titleImage = ""
           
        guard let condition = currentWeather.weather?.first?.main else { return titleImage }
           
        switch condition {
           case Constants.clear:
            titleImage = Constants.forestSunny
           case Constants.clouds:
            titleImage = Constants.forestCloudy
           case Constants.rain:
            titleImage = Constants.forestRainy
           default:
            titleImage = ""
           }
           
           return titleImage
       }
    func getThemeColor()->UIColor{
        
        var color = UIColor.clear
           
        guard let condition = currentWeather.weather?.first?.main else { return .clear }
           
        switch condition {
            case Constants.rain:
            color = UIColor.gray
           case Constants.clear:
            color = UIColor.green
           case Constants.clouds:
            color = UIColor.gray
           
           default:
            color = UIColor.clear
           }
           
           return color
    }
    func formatDegree(val: Double)-> String{
        return String(format: "%0.0f", val)
    }
    func getThemeViewColor()->Color{
        
        var color = Color.clear
           
        guard let condition = currentWeather.weather?.first?.main else { return .clear }
           
        switch condition {
            case Constants.rain:
            color = Color.gray
           case Constants.clear:
            color = Color.green
           case Constants.clouds:
            color = Color.gray
           
           default:
            color = Color.clear
           }
           
           return color
    }
     
    func getCurrentWeather(lat: CLLocationDegrees, lon: CLLocationDegrees){
        
      
        data = WeatherManager().getCurrentWeather(latitude: lat, longitude: lon)
            .mapError({ (error) -> Error in
                
                print(error)
                self.indicator = false
                
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: { weatherData in
                    self.indicator = false
                    guard let weather = weatherData else { return }
                    self.currentWeather = weather
            })
    }
    
    
    
    
}

 

       
 


