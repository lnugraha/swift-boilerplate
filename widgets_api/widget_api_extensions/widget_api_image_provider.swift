//
//  widget_api_image_provider.swift
//  widgets_api
//
//  Created by Leo Nugraha on 2021/8/26.
//

import Foundation
import SwiftUI

enum widget_api_image_response {
    case Success(image: UIImage)
    case Failure
}

struct widget_api_response: Decodable {
    var url: String
}

class widget_api_image_provider {
    
    // URL shared session comes here
    static func getImageFromApi(completion: ((widget_api_image_response)->Void)?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let date = Date()
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=qUrePonwSCvzDwQphoCCqDPicppR8prJV8lNQbkG&date=\(formatter.string(from: date))"
        
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            parseImageFromResponse(data: data, urlResponse: urlResponse, error: error, completion: completion)
        }
        task.resume()
    }
    
    // JSON decoding session goes here
    static func parseResponseAndGetImage(data: Data?, urlResponse: URLResponse?, error: Error?, completion: ((widget_api_image_response)->Void)?) {

        guard error == nil, let content = data else {
            print("DEBUG: ")
            let response = widget_api_image_response.Failure
            completion?(response)
            return
        }

        var widgetApiResponse: widget_api_response
        do {
            widgetApiResponse = try JSONDecoder().decode(widget_api_response.self, from: content)
        } catch {
            let response = widget_api_image_response.Failure
            completion?(response)
            return
        }

        let url = URL(string: widgetApiResponse.url)!
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            parseResponseAndGetImage(data: data, urlResponse: urlResponse, error: error, completion: completion)
        }
        task.resume()

    }
    
    static func parseImageFromResponse(data: Data?, urlResponse: URLResponse?, error: Error?, completion: ((widget_api_image_response)->Void)?) {

        guard error == nil, let content = data else {
            print("DEBUG: ")
            let response = widget_api_image_response.Failure
            completion?(response)
            return
        }
        
        let image = UIImage(data: content)!
        let response = widget_api_image_response.Success(image: image)
        completion?(response)
        
    }
    
}
