//
//  HeaderView.swift
//  Assessment
//
//  Created by shelton chiuswa on 21/9/2022.
//

import Foundation
import SwiftUI

struct HeaderView: View {

    var city: String
     var temperature: String
     var weather: String
    
    var body: some View{
        
        VStack{
            Text(city)
           .foregroundColor(.white)
           .font(.title)
             Text(temperature)
            .foregroundColor(.white)
            .font(.title)
            Text(weather)
            .foregroundColor(.white)
               .foregroundColor(.white)
               .font(.callout)
            
        }
    }
    
    
}

