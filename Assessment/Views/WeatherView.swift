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
    @ObservedObject private(set) var viewModel: CurrentViewModel
    @ObservedObject private(set) var forecast: ForecastViewModel
    @State var place: Places

    
    func getData(){
        viewModel.getCurrentWeather(lat: place.latitude, lon: place.longitude)
        forecast.getWeatherForcast(lat: place.latitude, lon: place.longitude)
    }
    var body: some View {
        VStack{
            
                    GeometryReader{ geo in
                        ZStack(alignment: .top){
                            self.viewModel.getThemeViewColor()
                            VStack{
                                Image(self.viewModel.Header())
                                    .resizable()
                                    .interpolation(.none)
                                    .frame(height: geo.size.height / 2.9)
                                    .overlay(HeaderView(
                                        city: viewModel.currentWeather.name!,
                                        temperature: "\(self.viewModel.formatDegree(val: self.viewModel.currentWeather.main?.temp ?? 0.0))°",
                                        weather: (self.viewModel.currentWeather.weather?.first!.description.uppercased() ?? "")!),
                                             alignment: .center)
                                HStack{
                                    VStack{
                                        Text("\(self.viewModel.formatDegree(val: self.viewModel.currentWeather.main?.temp_min ?? 0.0))°")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text("min")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                    Spacer()
                                    VStack{
                                        Text("\(self.viewModel.formatDegree(val: self.viewModel.currentWeather.main?.temp ?? 0.0))°")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text("Current")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                    Spacer()
                                    VStack{
                                        Text("\(self.viewModel.formatDegree(val: self.viewModel.currentWeather.main?.temp_max ?? 0.0))°")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text("max")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        
                                    }
                                }
                                .frame(width: geo.size.width - 40)
                                Divider()
                                    .background(Color.white)
                                
                                
                                
                                ForEach(self.forecast.weekDays){ data in
                                    ForecastViewRow(
                                        day: data.day ?? "",
                                        img: self.forecast.getImage(condition:data.condition ?? ""),
                                        temp: "\(self.viewModel.formatDegree(val: data.tempreture!) )°",
                                        color: self.viewModel.getThemeViewColor())
                                    
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                        
                    }
        }.onAppear(perform:{
            self.getData()
        })
  
        }
    }
 




