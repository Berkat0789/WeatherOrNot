//
//  MainVC.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //ib outlets for ui view
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //instances
    
    var currentweather = Weather()
    
    //Arrays
    
    var forecastList = [Forecast]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print(weatherURL)
        print(forecastURL)
        
        
        currentweather.downloadWeatherData {
              self.UpdateUI()
        }

    }//end view did load
    
    

    
 //function to update ui
    
    func UpdateUI() {
        weatherImg.image = UIImage(named: currentweather.weatherType)
        currentTemp.text = "\(currentweather.CurrentTemp)"
        todaysDate.text = currentweather.todaysDate
        cityName.text = currentweather.cityName
        weatherType.text = currentweather.weatherType
    }
    
    
///---Table view functions---//
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
///---function to get forecast data---///
    
    func downloadForecastData(complete: @escaping downloadComplete) {
        Alamofire.request(forecastURL).responseJSON{ response in
            let result = response.result
            
            
            if let Dict = result.value as? Dictionary<String, AnyObject> {
                
                if let List = Dict["list"] as? [Dictionary<String, AnyObject>] {
                // need  loop to pull  from list array and push data
                    
                    for forca in List {
                        let forecast = Forecast(weatherDict: forca)
                        self.forecastList.append(forecast)
                        print(forca)
                    }
                    
                    
                    
                }//end if let list
            
                
            }//end if let dict
            
            
            
            
            
            
        }//end alamo request
    
    }//end download forecast data
    
    
    
    
    
    
    
    
    


}// end controller
