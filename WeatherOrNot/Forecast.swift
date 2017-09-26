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
    var DayofWeek: String {
        if _dayofweek == nil {
            _dayofweek = ""
            
        }
        return _dayofweek
    }
    
//init forecast data functon
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let main = weatherDict["main"] as? Dictionary<String, AnyObject>{
            if let lowtemp = main["temp_min"] as? Double {
                let KeltoFar = lowtemp * (9/5) - 459.67
                let finalonvert = Double(round(10 * KeltoFar / 10))
                self._lowTemp = finalonvert
                print(self._lowTemp)
            }//end if let low temp 
            
            if let hightemp = main["temp_max"] as? Double {
                let KeltoFar = hightemp * (9/5) - 459.67
                let finalonvert = Double(round(10 * KeltoFar / 10))
                self._highTemp = finalonvert
                print(self._highTemp)
            }
            
        }//end  if let main
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let weathertype = weather[0]["main"] as? String {
                self._weatherType = weathertype
                print(self._weatherType)
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let convertedDate = Date(timeIntervalSince1970: date)
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .long
            dateformatter.timeStyle = .none
            dateformatter.dateFormat = "EEE"
            self._dayofweek = convertedDate.TodaysDate()
            print(self._dayofweek)
            
            
        }
        
        
        
        
        
    }//end init
    
    
    
}
//set date outside of class 

extension Date{
    func TodaysDate() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "EEEE"
        return dateformatter.string(from: self)
    }

}



