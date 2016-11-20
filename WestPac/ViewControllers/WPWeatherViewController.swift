//
//  WPWeatherViewController.swift
//  WestPac
//
//  Created by Macbook on 20/11/16.
//  Copyright © 2016 Niladri. All rights reserved.
//

import UIKit
extension WPWeatherViewController: WPWeatherDelegate {
    func weatherInfoLoadedSuccessfully(weather: WPWeather) {
        // do stuff like updating the UI
        dispatch_async(dispatch_get_main_queue(),{
            self.dispayCurrentWeather(weather)
        })
        
    }
    
    func weatherInfoLoadFailed(error: NSError) {
        
    }
}
class WPWeatherViewController: UIViewController {
//    UI outlets
    @IBOutlet weak var lblTemparature: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblFeelsLike: UILabel!
    @IBOutlet weak var imgWeatherIcon: UIImageView!
    
    var selectedLoaction:WPCity!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedLoaction.name
        WPWeatherManager.sharedManager.delegate = self
        WPWeatherManager.sharedManager.fetchWeatherInfo(forLocation: selectedLoaction)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dispayCurrentWeather(weather: WPWeather) {
        lblTemparature.text = String(format:"%d°F",weather.currentTemperature())
        lblSummary.text = weather.summaryString()
        lblFeelsLike.text = String(format:"Feels:%.2f°F",weather.feelsLikeTemperature())
        imgWeatherIcon.image = UIImage(named: weather.weatherIcon())
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
