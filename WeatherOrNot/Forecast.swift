//
//  Forecast.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import Foundation

class Forecast {
    
    private var _dayofweek: String!
    private var _lowTemp: Double!
    private var _highTemp: Double!
    private var _weatherType: String!
    
    
    var lowTemp: Double {
        if _lowTemp == nil {
            _lowTemp = 0.0
        }
        return _lowTemp
    }
    
    
    var highTemp: Double {
        if _highTemp == nil {
            _highTemp = 0.0
        }
        return _highTemp
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    
    
    
}
