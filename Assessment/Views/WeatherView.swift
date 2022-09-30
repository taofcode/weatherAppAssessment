//
//  WeatherView.swift
//  Assessment
//
//  Created by shelton chiuswa on 29/9/2022.
//

import Foundation
import SwiftUI
import CoreLocation
import CoreData

struct WeatherView: View {

     @ObservedObject var forecastViewModel = ForecastDetailViewModel(place: Places())
    @ObservedObject var viewModel = CurrentViewModel()
    @State  var place: Places
    @State var forecast: WeatherForecast  = WeatherForecast()
    @State var arrayWeather: [CurrentList] = [CurrentList]()
    @State var weekDays: [DailyForecast] = [DailyForecast]()
    
    
   
    @State private var location: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(self.forecastViewModel.weekDays){ data in
                    ForecastViewRow(
                        day: data.day ?? "",
                        img: self.forecastViewModel.getImage(condition:data.condition ?? ""),
                        temp: "\(self.viewModel.formatDegree(val: data.tempreture!) )°",
                        color: Color.gray)
                    
                    
                }
                        }
                
                Spacer()
            }
        .navigationTitle("View Deatail").font(.headline)
        }
    }
 




