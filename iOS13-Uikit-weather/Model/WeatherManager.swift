//
//  WeatherManager.swift
//  iOS13-Uikit-weather
//
//  Created by admin on 26/2/2565 BE.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=f8788d0330fcd61f7b655c9709c833bd&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
        print(urlString)
    }
    
    func performRequest(with urlString: String) {
        //1. create URL
        if let url = URL(string: urlString) { //prevent nil
            //2. create urlSesstion
            let session = URLSession(configuration: .default) //just like a web browser
            
            //3.give a session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                        //self because WeatherManager will notify the event
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //4.start the task
            task.resume()
        }
    }
    
    //Data is a formatt from response
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        //add .self to reference the type of WeatherData
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.conditionName)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
}
