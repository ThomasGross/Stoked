//
//  WeatherParserController.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 05/12/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParseController {
    
    var cellDataController = CellDataController()
    
    func getCurrentTemp(json: JSON) -> Double {
        let tempIntMin: Double = json["data"]["weather"][0]["mintempC"].doubleValue
        let tempIntMax: Double = json["data"]["weather"][0]["maxtempC"].doubleValue
        var result: Double = 0.0
        result = Double((tempIntMin + tempIntMax) / 2)
        return result
    }
    
    func getPrecipitation(json: JSON) -> String {
        let txt: String = json["data"]["weather"][0]["hourly"][0]["precipMM"].stringValue
        return txt
    }
    
    func getWeatherDescription(json: JSON) -> String {
        let txt: String = json["data"]["weather"][0]["hourly"][0]["weatherDesc"][0]["value"].stringValue
        return txt
    }
    
    func getIconForDay(day: Int, json: JSON) -> UIImage  {
        let image:UIImage = cellDataController.getImageFromPath(name: json["data"]["weather"][day]["hourly"][0]["weatherIconUrl"][0]["value"].stringValue)
        return image
    }
    
    func getWeatherForDay(day: Int, json: JSON) -> String {
        let tempMin: String = json["data"]["weather"][day]["mintempC"].stringValue
        let tempMax: String = json["data"]["weather"][day]["maxtempC"].stringValue
        return "\(tempMin)-\(tempMax)°"
    }
    
    func getWeekDay(day: Int, json: JSON) -> String {
        let tempWeekDayName: String = json["data"]["weather"][day]["date"].stringValue
        return Date().getDayOfWeek(today: tempWeekDayName)!
    }
    
    func getWindDirectionForDay(day: Int, json: JSON) -> String {
        let tempWindDirect: String = json["data"]["weather"][day]["hourly"][0]["winddir16Point"].stringValue
        return tempWindDirect
    }
    
    func getWindSpeedForDay(day: Int, json: JSON) -> String {
        let tempWindSpeed = json["data"]["weather"][day]["hourly"][0]["windspeedKmph"].stringValue
        return tempWindSpeed
    }
    
    func getWindDirectionArrowForDay(imageView: UIImageView, day: Int, json: JSON) -> UIImageView {
        let tempWindDirectionDegree: Double = json["data"]["weather"][day]["hourly"][0]["winddirDegree"].doubleValue
        let image: UIImage = (UIImage(named: "arrow")?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0)))!
        imageView.image = image
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        return imageView
    }
    
    func getWaveDirectionArrowForDay(imageView: UIImageView, day: Int, json: JSON) -> UIImageView {
        let tempWindDirectionDegree: Double = json["data"]["weather"][day]["hourly"][0]["swellDir"].doubleValue
        let image: UIImage = (UIImage(named: "arrow")?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0)))!
        imageView.image = image
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        return imageView
    }
    
    func getWaveHeightForDay(day: Int, json: JSON) -> String {
        return json["data"]["weather"][day]["hourly"][0]["swellHeight_m"].stringValue
    }
    func getWaveDirectionForDay(day: Int, json: JSON) -> String {
        return json["data"]["weather"][day]["hourly"][0]["swellDir16Point"].stringValue
    }
    func getWaveSpeedForDay(day: Int, json: JSON) -> String {
        return json["data"]["weather"][day]["hourly"][0]["swellPeriod_secs"].stringValue
    }
    
    func getHeightContraints(height: String, view: UIView) -> [NSLayoutConstraint] {
        let heightContraints = NSLayoutConstraint(item: view, attribute:
            .height, relatedBy: .equal, toItem: nil,
                     attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0,
                     constant: CGFloat(cellDataController.getHeightForWaveView(height: height)))
        
        let widthContraints = NSLayoutConstraint(item: view, attribute:
            .width, relatedBy: .equal, toItem: nil,
                    attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0,
                    constant: 42)
        
        return [heightContraints,widthContraints]
    }
    
    
    
    
    
    
    
}


    
