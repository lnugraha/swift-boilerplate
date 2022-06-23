//
//  WeatherViewModel.swift
//  WeatherPrediction
//
//  Created by Leo Nugraha on 2022/6/23.
//

import Foundation
import SwiftUI
import UIKit

let URL_API_CONSTANT: String = "https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,daily,minutely&lat=40.7128&lon=-74&units=imperial&appid=a25ffc3abde70c25f3d7f331151a9e3f"

class WeatherViewModel: ObservableObject {

    @Published public var title: String = ""
    @Published public var descriptionText: String = ""
    @Published public var temp: String = ""
    @Published public var timezone: String = ""

    public init() {
        fetchWeather()
    }
    
    public func fetchWeather() {
        let task = URLSession.shared.dataTask(with: URL(string: URL_API_CONSTANT)!) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "Description Unavailable"
                    self.temp = "\(model.current.temp)"
                    self.timezone = model.timezone
                }
                
            } catch {
                print("An error occured: \(error.localizedDescription)")
            }
            
        }
        
        task.resume()
        
    }
    
}
