//
//  ForecastView.swift
//  Assessment
//
//  Created by shelton chiuswa on 24/9/2022.
//

import Foundation
import SwiftUI
struct ForecastViewRow: View{

    var day: String
    var img: String
    var temp: String
    var color: Color
    
    var body: some View {
        
        HStack{
            
            Text(day)
            .foregroundColor(.white)
            .font(.headline)
            .padding()

            
            Spacer()
            Image(img)
            .resizable()
            .frame(width: 35, height: 35)
                
            Spacer()
            Text(temp)
            .foregroundColor(.white)
            .font(.headline)
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .background(color)
    }
}
