//
//  WeatherData.swift
//  iOS13-Uikit-weather
//
//  Created by admin on 26/2/2565 BE.
//

import Foundation

//Codable combine protocol into one
struct WeatherData: Codable {
    let name : String
    let main : Main
    let weather : [Weather]
    
}

struct Main: Codable {
    let temp : Double
}

struct Weather: Codable {
    let description : String
    let id : Int
}
