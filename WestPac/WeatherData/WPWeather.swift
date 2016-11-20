//
//  WPWeather.swift
//  WestPac
//
//  Created by Macbook on 19/11/16.
//  Copyright © 2016 Niladri. All rights reserved.
//

import UIKit

/**
 @abstract Data Class to hold and parse weather data
 */
class WPWeather: NSObject {
    private var temperature = 0
    private var apparentTemperature = 0.0
    private var summary = ""
    private var icon = ""
    
    
//    Returns current temparature as Int
    func currentTemperature() -> Int {
        return self.temperature
    }
    
//    Returns feels like temp as Double
    func feelsLikeTemperature() -> Double {
        return apparentTemperature
    }
    
//    Returns summary as string
    func summaryString() -> String {
        return summary
    }
    
//    Returns Icon name as string
    func weatherIcon() -> String {
        return icon
    }
  
//    Weather data parsing
    func parseWeatherData(responseData:NSData) {
        do {
            let weatherData = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions()) as? [String: AnyObject]
            let currentlyDictionary = weatherData?["currently"] as? [String : AnyObject]
            self.summary = currentlyDictionary?["summary"] as! String
            self.temperature = currentlyDictionary?["temperature"] as! Int
            self.apparentTemperature = currentlyDictionary?["apparentTemperature"] as! Double
            self.icon = currentlyDictionary?["icon"] as! String
        } catch {
            print(error)
        }
    }
}
