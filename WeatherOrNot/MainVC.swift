//
//  MainVC.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //ib outlets for ui view
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    
    //instances
    
    var currentweather = Weather()
    
    //Arrays
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(weatherURL)
        
        currentweather.downloadWeatherData {
            //
        }

    }


}
