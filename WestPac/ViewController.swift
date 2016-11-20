//
//  ViewController.swift
//  WestPac
//
//  Created by Macbook on 19/11/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

extension ViewController: WPWeatherDelegate {
    func weatherInfoLoadedSuccessfully(weather: WPWeather) {
        // do stuff like updating the UI
        print(weather.currentTemperature())
    }
    
    func weatherInfoLoadFailed(error: NSError) {
        
    }
}


class ViewController: UIViewController {
    var weatherInfo:WPWeather = WPWeather()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchWeatherInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchWeatherInfo() {
        let url = NSURL(string: "https://api.darksky.net/forecast/44978a229780b475cdd09923d22b981a/37.8267,-122.4233")
        let request = NSURLRequest(URL: url!)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            // notice that I can omit the types of data, response and error
//            self.weatherInfo.delegate = self
//            self.weatherInfo.parseWeatherData(data!)
            // your code
        });
        
        // do whatever you need with the task e.g. run
        task.resume()
    }
    
    func parseData(responseData:NSData) {
        var json: [String: AnyObject]!
        // 1
        do {
            json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions()) as? [String: AnyObject]
            print(json)
        } catch {
            print(error)
        }
    }
}

