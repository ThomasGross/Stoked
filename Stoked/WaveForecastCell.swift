//
//  WaveForecastCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 27/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import SwiftyJSON

class WaveForecastCell: UITableViewCell, LocationCellProtocol {
    
    // Today
    @IBOutlet weak var currentWaveHeight: UILabel!
    @IBOutlet weak var currentWaveDirection: UILabel!
    @IBOutlet weak var currentWaveDirectionIcon: UIImageView!
    @IBOutlet weak var currentWaveSpeed: UILabel!
    @IBOutlet weak var currentWaveHeightView: UIView!
    
    // First day
    @IBOutlet weak var firstDayWaveHeight: UILabel!
    @IBOutlet weak var firstDayWaveDirection: UILabel!
    @IBOutlet weak var firstDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var firstDayWaveSpeed: UILabel!
    @IBOutlet weak var firstDayName: UILabel!
    @IBOutlet weak var firstDayWaveHeightView: UIView!
    
    // Second day
    @IBOutlet weak var secondDayWaveHeight: UILabel!
    @IBOutlet weak var secondDayWaveDirect: UILabel!
    @IBOutlet weak var secondDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var secondDayWaveSpeed: UILabel!
    @IBOutlet weak var secondDayName: UILabel!
    @IBOutlet weak var secondDayWaveHeightView: UIView!
    
    // Third day
    @IBOutlet weak var thirdDayWaveHeight: UILabel!
    @IBOutlet weak var thirdDayWaveDirect: UILabel!
    @IBOutlet weak var thirdDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var thirdDayWaveSpeed: UILabel!
    @IBOutlet weak var thirdDayName: UILabel!
    @IBOutlet weak var thirdDayWaveHeightView: UIView!
    
    // Fourth day
    @IBOutlet weak var fourthDayWaveHeight: UILabel!
    @IBOutlet weak var fourthDayWaveDirect: UILabel!
    @IBOutlet weak var fourthDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var fourthDayWaveSpeed: UILabel!
    @IBOutlet weak var fourthDayName: UILabel!
    @IBOutlet weak var fourthDayWaveHeightView: UIView!
    
    
    func populateCell(json: JSON, location: LocationModel) {
        
        var tempWaveHeight: String = ""
        
        let parseController = ParseController()
        
        // Todays wave
        tempWaveHeight = parseController.getWaveHeightForDay(day: 0, json: json)
        currentWaveHeight.text = tempWaveHeight
        currentWaveDirection.text = parseController.getWaveDirectionForDay(day: 0, json: json)
        currentWaveSpeed.text = parseController.getWaveSpeedForDay(day: 0, json: json).appending("s")
        NSLayoutConstraint.activate(parseController.getHeightContraints(height: tempWaveHeight, view: currentWaveHeightView))
        currentWaveDirectionIcon = parseController.getWaveDirectionArrowForDay(imageView: currentWaveDirectionIcon, day: 0, json: json)
        
        // First day wave
        firstDayName.text = parseController.getWeekDay(day: 1, json: json)
        tempWaveHeight = parseController.getWaveHeightForDay(day: 1, json: json)
        firstDayWaveHeight.text = tempWaveHeight
        firstDayWaveDirection.text = parseController.getWaveDirectionForDay(day: 1, json: json)
        firstDayWaveSpeed.text = parseController.getWaveSpeedForDay(day: 1, json: json).appending("s")
        NSLayoutConstraint.activate(parseController.getHeightContraints(height: tempWaveHeight, view: firstDayWaveHeightView))
        firstDayWaveDirectIcon = parseController.getWaveDirectionArrowForDay(imageView: firstDayWaveDirectIcon, day: 1, json: json)
        
        
        // Second day wave
        secondDayName.text = parseController.getWeekDay(day: 2, json: json)
        tempWaveHeight = parseController.getWaveHeightForDay(day: 2, json: json)
        secondDayWaveHeight.text = tempWaveHeight
        secondDayWaveDirect.text = parseController.getWaveDirectionForDay(day: 2, json: json)
        secondDayWaveSpeed.text = parseController.getWaveSpeedForDay(day: 2, json: json).appending("s")
        NSLayoutConstraint.activate(parseController.getHeightContraints(height: tempWaveHeight, view: secondDayWaveHeightView))
        secondDayWaveDirectIcon = parseController.getWaveDirectionArrowForDay(imageView: secondDayWaveDirectIcon, day: 2, json: json)
        
        // Third day wave
        thirdDayName.text = parseController.getWeekDay(day: 3, json: json)
        tempWaveHeight = parseController.getWaveHeightForDay(day: 3, json: json)
        thirdDayWaveHeight.text = tempWaveHeight
        thirdDayWaveDirect.text = parseController.getWaveDirectionForDay(day: 3, json: json)
        thirdDayWaveSpeed.text = parseController.getWaveSpeedForDay(day: 3, json: json).appending("s")
        NSLayoutConstraint.activate(parseController.getHeightContraints(height: tempWaveHeight, view: thirdDayWaveHeightView))
        thirdDayWaveDirectIcon = parseController.getWaveDirectionArrowForDay(imageView: thirdDayWaveDirectIcon, day: 3, json: json)
        
        
        // Fourth day wave
        fourthDayName.text = parseController.getWeekDay(day: 4, json: json)
        tempWaveHeight = parseController.getWaveHeightForDay(day: 4, json: json)
        fourthDayWaveHeight.text = tempWaveHeight
        fourthDayWaveDirect.text = parseController.getWaveDirectionForDay(day: 4, json: json)
        fourthDayWaveSpeed.text = parseController.getWaveSpeedForDay(day: 4, json: json).appending("s")
        NSLayoutConstraint.activate(parseController.getHeightContraints(height: tempWaveHeight, view: fourthDayWaveHeightView))
        fourthDayWaveDirectIcon = parseController.getWaveDirectionArrowForDay(imageView: fourthDayWaveDirectIcon, day: 4, json: json)
    }
    

    
    
}
