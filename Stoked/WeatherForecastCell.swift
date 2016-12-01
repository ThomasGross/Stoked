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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(json: JSON, location: LocationModel) {
        
        var tempWeekDayName: String = ""
        
        // Current weather
        var txt: String = ""
        var tempIntMin: Double = 0.0
        var tempIntMax: Double = 0.0
        var result: Double = 0.0
        
        tempIntMin = json["data"]["weather"][0]["mintempC"].doubleValue
        tempIntMax = json["data"]["weather"][0]["maxtempC"].doubleValue
        
        result = Double((tempIntMin + tempIntMax) / 2)
        currentWeatherLabel.text = "\(result)°"
        txt = json["data"]["weather"][0]["hourly"][0]["precipMM"].stringValue
        precipitation.text = txt.appending("% PRECIPITATION")
        txt = json["data"]["weather"][0]["hourly"][0]["weatherDesc"][0]["value"].stringValue
        weatherDecription.text = txt.uppercased()
        
        currentWeatherIcon.image = CellDataHelper.getImageFromPath(name: json["data"]["weather"][0]["hourly"][0]["weatherIconUrl"][0]["value"].stringValue)
        
        var tempMin: String = ""
        var tempMax: String = ""
        
        // First day weather
        tempMin = json["data"]["weather"][1]["mintempC"].stringValue
        tempMax = json["data"]["weather"][1]["maxtempC"].stringValue
        firstDayTemp.text = "\(tempMin)-\(tempMax)°"
        
        tempWeekDayName = json["data"]["weather"][1]["date"].stringValue
        firstWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        firstDayIcon.image = CellDataHelper.getImageFromPath(name: json["data"]["weather"][1]["hourly"][0]["weatherIconUrl"][0]["value"].stringValue)
        
        // Second day weather
        tempMin = json["data"]["weather"][2]["mintempC"].stringValue
        tempMax = json["data"]["weather"][2]["maxtempC"].stringValue
        secondDayTemp.text = "\(tempMin)-\(tempMax)°"
        
        tempWeekDayName = json["data"]["weather"][2]["date"].stringValue
        secondWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        secondDayIcon.image = CellDataHelper.getImageFromPath(name: json["data"]["weather"][2]["hourly"][0]["weatherIconUrl"][0]["value"].stringValue)
        
        // Third day weather
        tempMin = json["data"]["weather"][3]["mintempC"].stringValue
        tempMax = json["data"]["weather"][3]["maxtempC"].stringValue
        thirdDayTemp.text = "\(tempMin)-\(tempMax)°"
        
        tempWeekDayName = json["data"]["weather"][3]["date"].stringValue
        thirdWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        thirdDayIcon.image = CellDataHelper.getImageFromPath(name: json["data"]["weather"][3]["hourly"][0]["weatherIconUrl"][0]["value"].stringValue)
        
        // Fourth day weather
        tempMin = json["data"]["weather"][4]["mintempC"].stringValue
        tempMax = json["data"]["weather"][4]["maxtempC"].stringValue
        fourthDayTemp.text = "\(tempMin)-\(tempMax)°"
        
        tempWeekDayName = json["data"]["weather"][4]["date"].stringValue
        fourthWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        fourthDayIcon.image = CellDataHelper.getImageFromPath(name: json["data"]["weather"][4]["hourly"][0]["weatherIconUrl"][0]["value"].stringValue)
        
        // Fifth day weather
        tempMin = json["data"]["weather"][5]["mintempC"].stringValue
        tempMax = json["data"]["weather"][5]["maxtempC"].stringValue
        fifthDayTemp.text = "\(tempMin)-\(tempMax)°"
        
        tempWeekDayName = json["data"]["weather"][5]["date"].stringValue
        fifthWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        fifthDayIcon.image = CellDataHelper.getImageFromPath(name: json["data"]["weather"][5]["hourly"][0]["weatherIconUrl"][0]["value"].stringValue)
        
    }
    
}
