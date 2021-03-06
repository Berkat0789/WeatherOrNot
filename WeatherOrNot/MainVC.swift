//
//  MainVC.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    //ib outlets for ui view
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //instances
    
    var currentweather = Weather()
    var forecast: Forecast!
    var locationManager = CLLocationManager()
    var currentLocaiton: CLLocation!
    
    
    //Arrays
    
    var forecastList = [Forecast]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        print(weatherURL)
        print(forecastURL)
        
        
     

    }//end view did load
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAutho()
    }
    
    
    
    
//---Function for getting locaiton--//
    
    func locationAutho() {
        if CLLocationManager.authorizationStatus() ==  .authorizedWhenInUse {
            currentLocaiton = locationManager.location
            Location.sharedInstance.Latitude = currentLocaiton.coordinate.latitude
            Location.sharedInstance.Longitude = currentLocaiton.coordinate.longitude
            currentweather.downloadWeatherData {
                self.downloadForecastData {
                    self.UpdateUI()
                    
                }
            }
            print(Location.sharedInstance.Latitude, Location.sharedInstance.Longitude)
            
        }else{
            locationManager.requestWhenInUseAuthorization()
            locationAutho()
        }
        
    }
    

    
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
        return forecastList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? weatherCell {
            
            let forecast = forecastList[indexPath.row]
            cell.uptateCell(forecast: forecast)
            return cell
            
        }else {
        return UITableViewCell()
        }

    }
    
///---function to get forecast data---///
    
    func downloadForecastData(complete: @escaping downloadComplete) {
        Alamofire.request(newforecastURL).responseJSON{ response in
            let result = response.result
            
            
            if let Dict = result.value as? Dictionary<String, AnyObject> {
                
                if let List = Dict["list"] as? [Dictionary<String, AnyObject>] {
                // need  loop to pull  from list array and push data
                    
                    for forca in List {
                        let forecast = Forecast(weatherDict: forca)
                        self.forecastList.append(forecast)
                        print(forca)
                    }
                    self.forecastList.remove(at: 0)
                    self.tableView.reloadData()
                    
                }//end if let list
            
                
            }//end if let dict
            
            complete()
            
            
            
            
        }//end alamo request
    
    }//end download forecast data
    
    
    
    
    
    
    
    
    


}// end controller
