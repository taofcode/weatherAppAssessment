//
//  FavouriteView.swift
//  Assessment
//
//  Created by shelton chiuswa on 28/9/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct FavouriteView: View {

    @State   var city: String = ""
    @ObservedObject var viewModel = CurrentViewModel()
    @ObservedObject var forecastViewModel = ForecastViewModel()
    @ObservedObject var favouriteViewModel = FavouriteViewModel()
    @State var places: [Places] = []
    @State var tempreture = 0.0
    @State  var condition = ""
    @State  var currentWeather: ResponseBody = ResponseBody()
    @State var arrayWeather: [CurrentList] = [CurrentList]()

    
  

    //
    var body: some View{
        NavigationView{
            
            VStack{
                VStack(spacing: 15) {
                    TextField("Add City", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save Favourites") {
                        favouriteViewModel.savePlace(city: city)
                        favouriteViewModel.populateData()
                        
                    }
                    .foregroundColor(.white)
                    .font(Font.body.bold())
                    .padding(10)
                    .padding(.horizontal, 20)
                    .background(viewModel.getThemeViewColor())
                    .cornerRadius(10)
                }.padding()
                List{
                    ForEach(favouriteViewModel.populateData(),id:\.id){place in

                            VStack{
                                NavigationLink(destination: WeatherView(viewModel: viewModel,forecast: forecastViewModel,place:place)){
                                    Text("\(place.name!)")
                                    .foregroundColor(viewModel.getThemeViewColor())
                                    .font(.headline)
                                }
                        }
                        
                    }.onDelete(perform: favouriteViewModel.delete)
                }
                Spacer()
            }.onAppear(perform:{
                favouriteViewModel.populateData()
            })
        }.navigationBarTitle("Favourites")
    }
}
