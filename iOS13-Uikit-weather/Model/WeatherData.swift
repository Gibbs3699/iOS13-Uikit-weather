//
//  WeatherData.swift
//  iOS13-Uikit-weather
//
//  Created by admin on 26/2/2565 BE.
//

import Foundation

struct WeatherData: Decodable {
    let name : String
    let main : Main
    let weather : [Weather]
    
}

struct Main: Decodable {
    let temp : Double
}

struct Weather: Decodable {
    let description : String
}
