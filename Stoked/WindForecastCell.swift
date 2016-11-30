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
        var tempimageIcon: UIImage?
        
        var tempWindDirect: String = ""
        var tempWindSpeed: String = ""
        var tempWindDirectionDegree: Double = 0.0
        
        // Todays wind
        tempWindDirect = json["data"]["weather"][0]["hourly"][0]["winddir16Point"].stringValue
        currentWindDirection.text = tempWindDirect
        tempWindSpeed = json["data"]["weather"][0]["hourly"][0]["windspeedKmph"].stringValue
        currentWindSpeed.text = tempWindSpeed
        
        // Icon rotation
        tempWindDirectionDegree = json["data"]["weather"][0]["hourly"][0]["winddirDegree"].doubleValue
        currentWindDirectionIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        tempimageIcon = currentWindDirectionIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        currentWindDirectionIcon.image = tempimageIcon
        
        // First day wind
        tempWeekDayName = json["data"]["weather"][1]["date"].stringValue
        firstDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        tempWindDirect = json["data"]["weather"][1]["hourly"][0]["winddir16Point"].stringValue
        firstDayWindDirection.text = tempWindDirect
        tempWindSpeed = json["data"]["weather"][1]["hourly"][0]["windspeedKmph"].stringValue
        firstDayWindSpeed.text = tempWindSpeed
        
        // Icon
        tempWindDirectionDegree = json["data"]["weather"][1]["hourly"][0]["winddirDegree"].doubleValue
        firstDayWindIDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        tempimageIcon = firstDayWindIDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        firstDayWindIDirectIcon.image = tempimageIcon
        
        
        // Second day wind
        tempWeekDayName = json["data"]["weather"][2]["date"].stringValue
        secondDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        tempWindDirect = json["data"]["weather"][2]["hourly"][0]["winddir16Point"].stringValue
        secondDayWindDirect.text = tempWindDirect
        tempWindSpeed = json["data"]["weather"][2]["hourly"][0]["windspeedKmph"].stringValue
        secondDayWindSpeed.text = tempWindSpeed
        
        // Icon
        tempWindDirectionDegree = json["data"]["weather"][2]["hourly"][0]["winddirDegree"].doubleValue
        secondDayWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        tempimageIcon = secondDayWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        secondDayWindDirectIcon.image = tempimageIcon
        
        // Third day wind
        tempWeekDayName = json["data"]["weather"][3]["date"].stringValue
        thirdDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        tempWindDirect = json["data"]["weather"][3]["hourly"][0]["winddir16Point"].stringValue
        thirdDayWindDirect.text = tempWindDirect
        tempWindSpeed = json["data"]["weather"][3]["hourly"][0]["windspeedKmph"].stringValue
        thirdDayWindSpeed.text = tempWindSpeed
        
        // Icon
        tempWindDirectionDegree = json["data"]["weather"][3]["hourly"][0]["winddirDegree"].doubleValue
        thirdDayWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        tempimageIcon = thirdDayWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        thirdDayWindDirectIcon.image = tempimageIcon
        
        
        // Fourth day wind
        tempWeekDayName = json["data"]["weather"][4]["date"].stringValue
        fourthDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        
        tempWindDirect = json["data"]["weather"][4]["hourly"][0]["winddir16Point"].stringValue
        fourthDayWindDirect.text = tempWindDirect
        tempWindSpeed = json["data"]["weather"][4]["hourly"][0]["windspeedKmph"].stringValue
        fourthDayWindSpeed.text = tempWindSpeed
        
        // Icon rotation
        tempWindDirectionDegree = json["data"]["weather"][4]["hourly"][0]["winddirDegree"].doubleValue
        fourthDayWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        tempimageIcon = fourthDayWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        fourthDayWindDirectIcon.image = tempimageIcon
        
    }
    
}
