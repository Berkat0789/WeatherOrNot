//
//  weatherCell.swift
//  WeatherOrNot
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell {
    
///---Ib outlets---///

    @IBOutlet weak var weathericon: UIImageView!
    @IBOutlet weak var dayofweek: UILabel!
    @IBOutlet weak var weathertype: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowtemp: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }


}
