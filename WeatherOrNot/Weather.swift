//
//  Weather.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _weathertype: String!
    private var _cityName: String!
    private var _Date: String!
    private var _CurrentTemp: Double!
    
    
    //set getters 
    
    var weatherType: String {
        if _weathertype == nil {
            _weathertype = ""
        }
        return _weathertype
    }
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var todaysDate: String {
        if _Date == nil {
            _Date = ""
        }
        
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        let currentdate = dateFormat.string(from: Date())
        self._Date = "Today's Date is \(currentdate)"

        
        return _Date
    }
    
    var CurrentTemp: Double {
        if _CurrentTemp == nil {
            _CurrentTemp = 0.0
        }
        return _CurrentTemp
    }
    

//function to call weather Data from Api
    
    func downloadWeatherData(complete: downloadComplete) {
        Alamofire.request(weatherURL).responseJSON {responce in
            let result = responce.result
            print(responce)
            
        }//end Alamo Request 
        
        
    }//end downoad weather func
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
