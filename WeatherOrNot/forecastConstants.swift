//
//  forecastConstants.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import Foundation


let forecastbaseURL = "http://api.openweathermap.org/data/2.5/forecast?"
let forecastLat = "lat="
let forecastLong = "&lon="
let forecastappID = "&appid="
let forecastApiKey = "6a3fce8a6c1501611c53864e6f1b892f"

let forecastURL = "\(forecastbaseURL)\(forecastLat)\(Location.sharedInstance.Latitude)\(forecastLong)\(Location.sharedInstance.Longitude)\(forecastappID)\(forecastApiKey)"


//40.728157
//-74.077642



let newforecastURL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.Latitude!)&lon=\(Location.sharedInstance.Longitude!)&appid=6a3fce8a6c1501611c53864e6f1b892f"
