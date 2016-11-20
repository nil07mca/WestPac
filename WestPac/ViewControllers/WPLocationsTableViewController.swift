//
//  WPLocationsTableViewController.swift
//  WestPac
//
//  Created by Macbook on 20/11/16.
//  Copyright © 2016 Niladri. All rights reserved.
//

import UIKit

class WPLocationsTableViewController: UITableViewController {
//    var selectedLoaction:NSDictionary!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Locations"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return WPLocationManager().fetchLocations().count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let location = WPLocationManager().fetchLocations()[indexPath.row] as? WPCity
        let cell = tableView.dequeueReusableCellWithIdentifier("locationCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = location?.name
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedLoaction = WPLocationManager().fetchLocations()[indexPath.row] as? WPCity
        [self .performSegueWithIdentifier("WeatherInfoView", sender: selectedLoaction)]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailsViewController = segue.destinationViewController as! WPWeatherViewController
        detailsViewController.selectedLoaction = sender as? WPCity
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
