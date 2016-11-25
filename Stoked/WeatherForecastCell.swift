//
//  WeatherForecastCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 24/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class WeatherForecastCell: UITableViewCell {

    
    // currentday
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var weatherDecription: UILabel!
    
    @IBOutlet weak var precipitation: UILabel!
    
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    
    // day 1
    @IBOutlet weak var firstDayIcon: UIImageView!
    @IBOutlet weak var firstDayTemp: UILabel!
    @IBOutlet weak var firstWeekdayName: UILabel!
    
    // day 2
    @IBOutlet weak var secondDayIcon: UIImageView!
    @IBOutlet weak var secondDayTemp: UILabel!
    @IBOutlet weak var secondWeekdayName: UILabel!
    
    // day 3
    @IBOutlet weak var thirdDayIcon: UIImageView!
    @IBOutlet weak var thirdDayTemp: UILabel!
    @IBOutlet weak var thirdWeekdayName: UILabel!
    
    // day 4
    @IBOutlet weak var fourthDayIcon: UIImageView!
    @IBOutlet weak var fourthDayTemp: UILabel!
    @IBOutlet weak var fourthWeekdayName: UILabel!
    
    // day 5
    @IBOutlet weak var fifthDayIcon: UIImageView!
    @IBOutlet weak var fifthDayTemp: UILabel!
    @IBOutlet weak var fifthWeekdayName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
