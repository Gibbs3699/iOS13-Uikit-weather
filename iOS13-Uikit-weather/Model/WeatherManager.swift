//
//  WeatherManager.swift
//  iOS13-Uikit-weather
//
//  Created by admin on 26/2/2565 BE.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=f8788d0330fcd61f7b655c9709c833bd&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func performRequest(urlString: String) {
        //1. create URL
        if let url = URL(string: urlString) { //prevent nil
            //2. create urlSesstion
            let session = URLSession(configuration: .default) //just like a web browser
            
            //3.give a session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            
            //4.start the task
            task.resume()
        }
    }
    
    //Data is a formatt from response
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        //add self to reference the type of WeatherData
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            getConditionName(weatherId: id)
            print(decodedData.weather[0].id)
        } catch {
            print(error)
        }
    }
    
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
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
