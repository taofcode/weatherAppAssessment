//
//  DailyForecast.swift
//  Assessment
//
//  Created by shelton chiuswa on 25/9/2022.
//

import Foundation
struct DailyForecast: Identifiable {
    
    var id: UUID
    var day: String?
    var tempreture: Double?
    var condition: String?
}
