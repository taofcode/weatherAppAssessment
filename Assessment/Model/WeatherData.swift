//
//  WeatherData.swift
//  Assessment
//
//  Created by shelton chiuswa on 21/9/2022.
//

import Foundation


 

struct ResponseBody: Codable {
    var weather: [WeatherResponse]?
    var main: MainResponse?
    var name: String?

}

    struct WeatherResponse: Codable {
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Codable {
        var temp: Double
        var temp_min: Double
        var temp_max: Double
        

    }


