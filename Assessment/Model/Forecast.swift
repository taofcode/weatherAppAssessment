//
//  Forecast.swift
//  Assessment
//
//  Created by shelton chiuswa on 23/9/2022.
//

import Foundation


struct WeatherForecast: Codable {
   
 
 
    var message: Int?
    var cnt: Int?
    var list: [CurrentList]?
    
   

}

struct CurrentList: Codable {
 
    var dt: Int?
    var main: MainClass?
    var weather: [WeatherData]?
    var dt_txt: String?

     
}

struct MainClass: Codable {
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    

}

struct WeatherData:  Codable {
    var main: MainEnum?
    var description: Description?
   

  
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}


