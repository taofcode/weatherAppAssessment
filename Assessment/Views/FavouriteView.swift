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
    @ObservedObject var favModel = FavouriteViewModel()
    @State var places: [Places] = []

    

    //
    var body: some View{
        NavigationView{
            
            VStack{
                VStack(spacing: 15) {
                    TextField("Add City", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save Favourites") {
                        favModel.savePlace(city: city)
                        favModel.populateData()
                        
                    }
                    .foregroundColor(.white)
                    .font(Font.body.bold())
                    .padding(10)
                    .padding(.horizontal, 20)
                    .background(viewModel.getThemeViewColor())
                    .cornerRadius(10)
                }.padding()
                List{
                    ForEach(favModel.populateData(),id:\.id){place in

                            VStack{
                                NavigationLink(destination: WeatherView(place: place)){
                                    Text("\(place.name!)")
                                    .foregroundColor(viewModel.getThemeViewColor())
                                    .font(.headline)
                            }
                        }
                        
                    }.onDelete(perform: favModel.delete)
                }
                Spacer()
            }.onAppear(perform:{
                favModel.populateData()
            })
        }.navigationBarTitle("Favourites")
    }
}
