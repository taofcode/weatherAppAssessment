//
//  ForecastDetailViewModel.swift
//  Assessment
//
//  Created by shelton chiuswa on 30/9/2022.
//

import Foundation
import Combine
import CoreLocation

class ForecastDetailViewModel : ObservableObject{
    
    
    
    @Published var forecast: WeatherForecast  = WeatherForecast()
    @Published var arrayWeather: [CurrentList] = [CurrentList]()
    @Published var weekDays: [DailyForecast] = [DailyForecast]()
    
    @Published var isLoading: Bool = false
    
    var data : AnyCancellable?
   
    
    init(place:Places) {
        
        getWeatherForcast(lat: place.latitude ,
                          lon:  place.longitude)
    }

    func getDay(date: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFmt = DateFormatter()
        dateFmt.timeZone = TimeZone(abbreviation: "CAT")
        dateFmt.locale = NSLocale.current
        dateFmt.dateFormat = "EEEE"
        let strDate = dateFmt.string(from: date)
        return strDate
    }
    
    func getImage(condition: String)-> String{
        
        var img = ""
        
        switch condition {
        case Constants.clear:
            img = Constants.clearIcon
        case Constants.clouds:
            img = Constants.cloudsIcon
        case Constants.rain:
            img = Constants.rainIcon
        default:
            img = ""
        }
        
        return img
    }
  
}


extension ForecastDetailViewModel{
    
    func getWeatherForcast(lat: CLLocationDegrees, lon: CLLocationDegrees){
        
      
        data = WeatherManager().getWeatherForcast(latitude: lat, longitude: lon)
            .mapError({ (error) -> Error in
                
                print(error)
                
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: { weatherData in
                    guard let weather = weatherData else { return }
                _ = weather.list!.map{
                    
                    let mutableForecast = $0
                    self.weekDays.append(
                        DailyForecast(id: UUID(),
                        day: self.getDay(date: mutableForecast.dt ?? 0),
                        tempreture: mutableForecast.main?.temp,
                        condition: mutableForecast.weather!.first?.main?.rawValue
                        ))
                }
                
                self.weekDays = self.weekDays.uniq(by: {$0.day})
                self.forecast = weather
  
            })
    }
    
    
    func getLocationString(_ coordinateFor: Double) -> String {
        
        return String(coordinateFor)
    }
    
   
}


