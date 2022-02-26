//
//  WeatherModel.swift
//  iOS13-Uikit-weather
//
//  Created by admin on 26/2/2565 BE.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString : String {
        let tempRounded = String(format: "%.1f", temperature)
        return "\(tempRounded) °C"
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "Rain_storm"
        case 300...321:
            return "rainy"
        case 500...531:
            return "raindrops"
        case 600...622:
            return "snowy"
        case 701...781:
            return "cloudy"
        case 800:
            return "slight_touch_happyday"
        case 801...804:
            return "Rain_storm"
        default:
            return "partly_cloudy"
        }
    }
}
