//
//  ContentView.swift
//  Assessment
//
//  Created by shelton chiuswa on 21/9/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CurrentViewModel()
    @ObservedObject var forecastViewModel = ForecastViewModel()

    init() {
//        UITableView.appearance().backgroundColor = viewModel.getThemeColor()
        UITableView.appearance().separatorStyle = .none
        
        
    }
    
    var body: some View {
        GeometryReader{ geo in
            ZStack(alignment: .top){
               self.viewModel.getThemeViewColor()
                VStack{
                    Image(self.viewModel.Header())
                        .resizable()
                        .interpolation(.none)
                            .frame(height: geo.size.height / 2.9)
                            .overlay(HeaderView(
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
                    
                   
 
                         ForEach(self.forecastViewModel.weekDays){ data in
                             ForecastViewRow(
                                day: data.day ?? "",
                                img: self.forecastViewModel.getImage(condition:data.condition ?? ""),
                                temp: "\(self.viewModel.formatDegree(val: data.tempreture!) )°",
                                 color: self.viewModel.getThemeViewColor())
 
 
                         }
                    
               
                }
                
                
            }

        }
        
    }
        
    

}
