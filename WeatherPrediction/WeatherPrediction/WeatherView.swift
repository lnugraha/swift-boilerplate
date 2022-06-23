//
//  ContentView.swift
//  WeatherPrediction
//
//  Created by Leo Nugraha on 2022/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text(viewModel.timezone)
                    .font(.system(size: 32))
                Text(viewModel.temp)
                    .font(.system(size: 32))
                Text(viewModel.title)
                    .font(.system(size: 32))
                Text(viewModel.descriptionText)
                    .font(.system(size: 32))
            }.navigationTitle("Weather MVVM Design Pattern")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
