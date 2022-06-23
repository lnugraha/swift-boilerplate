//
//  WeatherModel.swift
//  WeatherPrediction
//
//  Created by Leo Nugraha on 2022/6/23.
//

import Foundation
import SwiftUI

struct WeatherModel: Codable {
    
    var timezone: String
    var current: CurrentWeather

}

struct CurrentWeather: Codable {
    
    var temp: Float
    var weather: [WeatherInfo]
    
}

struct WeatherInfo: Codable {
    
    var main: String
    var description: String
    
    
}
