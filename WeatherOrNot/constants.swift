//
//  constants.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import Foundation



let base_URL = "http://api.openweathermap.org/data/2.5/weather?"
let lattitude = "lat="
let longitude = "&lon="
let appID = "&appid="
let apiKEy = "a284c3b23d069ce67d9091b806b4e217"

// typ aliasfor downoad complte

typealias downloadComplete = () -> ()

let weatherURL = "\(base_URL)\(lattitude)40.728157\(longitude)-74.077642\(appID)\(apiKEy)"
