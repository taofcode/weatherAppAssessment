//
//  WeatherManager.swift
//  Assessment
//
//  Created by shelton chiuswa on 21/9/2022.
//

import Foundation
import CoreLocation
import Combine

class WeatherManager{
    
    static let client = APIClient()
    
    func getCurrentWeather(latitude: CLLocationDegrees,longitude: CLLocationDegrees) -> AnyPublisher<ResponseBody?, Error> {
        
        guard let url = URL(string: "\(Constants.baseUrl)\(Constants.current_uri)?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.apiKey)&units=\(Constants.units)") else { fatalError("Missing URL")}
        let request = URLRequest(url: url)
        return WeatherManager.client.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
        
    }
    
    
    
    func getWeatherForcast(latitude: CLLocationDegrees,longitude: CLLocationDegrees) -> AnyPublisher<WeatherForecast?, Error> {
        guard let url = URL(string: "\(Constants.baseUrl)\(Constants.forcast_uri)?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.apiKey)&units=\(Constants.units)") else { fatalError("Missing URL")}
        let request = URLRequest(url: url)
        
        return WeatherManager.client.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
        
    }
    
    
    
}
    
    
    
