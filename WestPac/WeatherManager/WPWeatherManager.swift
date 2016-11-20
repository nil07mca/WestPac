//
//  WPWeatherManager.swift
//  WestPac
//
//  Created by Macbook on 20/11/16.
//  Copyright © 2016 Niladri. All rights reserved.
//

import UIKit
/**
 @abstract Weather Manager to fetch weather information
 */
protocol WPWeatherDelegate: class {
    func weatherInfoLoadedSuccessfully(weather: WPWeather)
    func weatherInfoLoadFailed(error: NSError)
}
class WPWeatherManager: NSObject {
//    Shared Manager creation
    static let sharedManager = WPWeatherManager()
//    Delegate declairation
    weak var delegate:WPWeatherDelegate?
    
//    Servier call to fetch weather information
    func fetchWeatherInfo(forLocation location:WPCity) {
        let weatherInfo:WPWeather = WPWeather()
        let lattitude = location.latitude
        let longitude = location.longitude
        let strURL = BASE_URL + API_KEY + "/" + lattitude! + "," + longitude!
        let url = NSURL(string: strURL)
        let request = NSURLRequest(URL: url!)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            // notice that I can omit the types of data, response and error
            weatherInfo.parseWeatherData(data!)
            self.delegate!.weatherInfoLoadedSuccessfully(weatherInfo)
            // your code
        });
        
        // do whatever you need with the task e.g. run
        task.resume()
    }
}
