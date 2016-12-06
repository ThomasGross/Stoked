//
//  WindForecastCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 26/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import SwiftyJSON

class WindForecastCell: UITableViewCell, LocationCellProtocol {
    
    // Today
    @IBOutlet weak var currentWindDirection: UILabel!
    @IBOutlet weak var currentWindDirectionIcon: UIImageView!
    @IBOutlet weak var currentWindSpeed: UILabel!
    
    // First day
    @IBOutlet weak var firstDayWindDirection: UILabel!
    @IBOutlet weak var firstDayWindIDirectIcon: UIImageView!
    @IBOutlet weak var firstDayWindSpeed: UILabel!
    @IBOutlet weak var firstDayName: UILabel!
    
    // Second day
    @IBOutlet weak var secondDayWindDirect: UILabel!
    @IBOutlet weak var secondDayWindDirectIcon: UIImageView!
    @IBOutlet weak var secondDayWindSpeed: UILabel!
    @IBOutlet weak var secondDayName: UILabel!

    // Third day
    @IBOutlet weak var thirdDayWindDirect: UILabel!
    @IBOutlet weak var thirdDayWindDirectIcon: UIImageView!
    @IBOutlet weak var thirdDayWindSpeed: UILabel!
    @IBOutlet weak var thirdDayName: UILabel!
    
    // Fourth day
    @IBOutlet weak var fourthDayWindDirect: UILabel!
    @IBOutlet weak var fourthDayWindDirectIcon: UIImageView!
    @IBOutlet weak var fourthDayWindSpeed: UILabel!
    @IBOutlet weak var fourthDayName: UILabel!
    

    
    func populateCell(json: JSON, location: LocationModel) {
        
        let parseController = ParseController()
        
        // Todays wind
        currentWindDirection.text = parseController.getWindDirectionForDay(day: 0, json: json)
        currentWindSpeed.text = parseController.getWindSpeedForDay(day: 0, json: json)
        currentWindDirectionIcon = parseController.getWindDirectionArrowForDay(imageView: currentWindDirectionIcon,day: 0, json: json)
        
        // First day wind
        firstDayName.text = parseController.getWeekDay(day: 1, json: json)
        firstDayWindDirection.text = parseController.getWindDirectionForDay(day: 1, json: json)
        firstDayWindSpeed.text = parseController.getWindSpeedForDay(day: 1, json: json)
        firstDayWindIDirectIcon = parseController.getWindDirectionArrowForDay(imageView: firstDayWindIDirectIcon, day: 1, json: json)
        
        // Second day wind
        secondDayName.text = parseController.getWeekDay(day: 2, json: json)
        secondDayWindDirect.text = parseController.getWindDirectionForDay(day: 2, json: json)
        secondDayWindSpeed.text = parseController.getWindSpeedForDay(day: 2, json: json)
        secondDayWindDirectIcon = parseController.getWindDirectionArrowForDay(imageView: secondDayWindDirectIcon, day: 2, json: json)
        
        // Third day wind
        thirdDayName.text = parseController.getWeekDay(day: 3, json: json)
        thirdDayWindDirect.text = parseController.getWindDirectionForDay(day: 3, json: json)
        thirdDayWindSpeed.text = parseController.getWindSpeedForDay(day: 3, json: json)
        thirdDayWindDirectIcon = parseController.getWindDirectionArrowForDay(imageView: thirdDayWindDirectIcon, day: 3, json: json)
        
        // Fourth day wind
        fourthDayName.text = parseController.getWeekDay(day: 4, json: json)
        fourthDayWindDirect.text = parseController.getWindDirectionForDay(day: 4, json: json)
        fourthDayWindSpeed.text = parseController.getWindSpeedForDay(day: 4, json: json)
        fourthDayWindDirectIcon = parseController.getWindDirectionArrowForDay(imageView: fourthDayWindDirectIcon, day: 4, json: json)
        
    }
    
}
