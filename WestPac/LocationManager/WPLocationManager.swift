//
//  WPLocationManager.swift
//  WestPac
//
//  Created by Macbook on 20/11/16.
//  Copyright © 2016 Niladri. All rights reserved.
//

import UIKit
/**
 @abstract LocationManager to read city list from plist
 */
class WPLocationManager: NSObject {
    private var locations:[WPCity]=[]
    
//    Read locations from plist in bundle returns array of WPCity
    func fetchLocations() -> NSArray {
        let path = NSBundle.mainBundle().pathForResource("Locations", ofType: "plist")!
        let cityNames = NSArray(contentsOfFile: path) as! [NSDictionary]
        for dictCity in cityNames {
            let city:WPCity = WPCity()
            city.name = dictCity["City"] as? String
            city.latitude = dictCity["Lattitude"] as? String
            city.longitude = dictCity["Longitude"] as? String
            locations.insert(city, atIndex: 0);
        }
        return locations;
    }
}
