//
//  WeatherForecastCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 24/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherForecastCell: UITableViewCell, LocationCellProtocol {
    
    
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
    
    
    func populateCell(json: JSON, location: LocationModel) {
        
        let parseController = ParseController()
        
        // Current day
        currentWeatherLabel.text = "\(parseController.getCurrentTemp(json: json))°"
        precipitation.text = "\(parseController.getPrecipitation(json: json))% PRECIPITATION"
        weatherDecription.text = parseController.getWeatherDescription(json: json).uppercased()
        currentWeatherIcon.image = parseController.getIconForDay(day: 0, json: json)
        
        // first day
        firstDayTemp.text = parseController.getWeatherForDay(day: 1, json: json)
        firstWeekdayName.text = parseController.getWeekDay(day: 1, json: json)
        firstDayIcon.image = parseController.getIconForDay(day: 1, json: json)
        
        // Second day
        secondDayTemp.text = parseController.getWeatherForDay(day: 2, json: json)
        secondWeekdayName.text = parseController.getWeekDay(day: 2, json: json)
        secondDayIcon.image = parseController.getIconForDay(day: 2, json: json)
        
        // Third day
        thirdDayTemp.text = parseController.getWeatherForDay(day: 3, json: json)
        thirdWeekdayName.text = parseController.getWeekDay(day: 3, json: json)
        thirdDayIcon.image = parseController.getIconForDay(day: 3, json: json)
        
        // Fourth day
        fourthDayTemp.text = parseController.getWeatherForDay(day: 4, json: json)
        fourthWeekdayName.text = parseController.getWeekDay(day: 4, json: json)
        fourthDayIcon.image = parseController.getIconForDay(day: 4, json: json)
        
        // Fifth day
        fifthDayTemp.text = parseController.getWeatherForDay(day: 5, json: json)
        fifthWeekdayName.text = parseController.getWeekDay(day: 5, json: json)
        fifthDayIcon.image = parseController.getIconForDay(day: 5, json: json)
        
        
    }
    
}
