//
//  APIHandler.swift
//  weather_forecast_twn
//
//  Created by Leo Nugraha on 2021/8/26.
//

import Foundation
import UIKit

enum APIResponse {
    case Success
    case Failure
}

class APIHandlerController: NSObject {

    // Closure on what to be returned
    public class func getDataFromApi() {
        let fullAddress = "https://api.openweathermap.org/data/2.5/weather?lat=\(TAIPEI_Coordinate.latitude)&lon=\(TAIPEI_Coordinate.longitude)&appid=\(API_KEY)&units=metric"
        
        // Set HTTP Request Header and Body
        let url = URL(string: fullAddress)
        var request: URLRequest = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Accept")

        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            let httpResponse = response as? HTTPURLResponse
            let statusCodeResponse = httpResponse?.statusCode

            // Create an error handler here
                if let data = data, let dataString = String(data: data, encoding: String.Encoding.utf8) {
                    print("DEBUG: \(#function) \(#line) - Status Code Response: \(String(describing: statusCodeResponse))")
                     print("DEBUG: Response data string:\n \(dataString)")

                    
                    dispatchGroup.leave()
                } // end-if let data


        } // end-of URL session
        task.resume()

    }

    public func parseResponseAndGetData() {
        
    }

}
