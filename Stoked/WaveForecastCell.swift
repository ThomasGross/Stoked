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
        
        var tempWaveHeight: String = ""
        var tempWaveDirect: String = ""
        var tempWaveSpeed: String = ""
        var tempWaveDirectionDegree: Double = 0.0
        var tempWaveHeightOffset: Double = 0.0
        
        // Todays wave
        tempWaveHeight = json["data"]["weather"][0]["hourly"][0]["swellHeight_m"].stringValue
        currentWaveHeight.text = tempWaveHeight
        currentWaveHeightView.frame.size.height = CGFloat(Float(CellDataHelper.getHeightForWaveView(height: tempWaveHeight)))
        tempWaveHeightOffset = 100 - CellDataHelper.getHeightForWaveView(height: tempWaveHeight)
        currentWaveHeightView.frame = currentWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
        
        tempWaveDirect = json["data"]["weather"][0]["hourly"][0]["swellDir16Point"].stringValue
        currentWaveDirection.text = tempWaveDirect
        tempWaveSpeed = json["data"]["weather"][0]["hourly"][0]["swellPeriod_secs"].stringValue
        currentWaveSpeed.text = tempWaveSpeed.appending("s")
        
        // Icon rotation
        tempWaveDirectionDegree = json["data"]["weather"][0]["hourly"][0]["swellDir"].doubleValue
        currentWaveDirectionIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
        tempimageIcon = currentWaveDirectionIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        currentWaveDirectionIcon.image = tempimageIcon
        
        // First day wave
        tempWaveHeight = json["data"]["weather"][1]["hourly"][0]["swellHeight_m"].stringValue
        firstDayWaveHeight.text = tempWaveHeight
        firstDayWaveHeightView.frame.size.height = CGFloat(Float(CellDataHelper.getHeightForWaveView(height: tempWaveHeight)))
        tempWaveHeightOffset = 100 - CellDataHelper.getHeightForWaveView(height: tempWaveHeight)
        firstDayWaveHeightView.frame = firstDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
        tempWeekDayName = json["data"]["weather"][1]["date"].stringValue
        firstDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        tempWaveDirect = json["data"]["weather"][1]["hourly"][0]["swellDir16Point"].stringValue
        firstDayWaveDirection.text = tempWaveDirect
        tempWaveSpeed = json["data"]["weather"][1]["hourly"][0]["swellPeriod_secs"].stringValue
        firstDayWaveSpeed.text = tempWaveSpeed.appending("s")
        
        // Icon
        tempWaveDirectionDegree = json["data"]["weather"][1]["hourly"][0]["swellDir"].doubleValue
        firstDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
        tempimageIcon = firstDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        firstDayWaveDirectIcon.image = tempimageIcon
        
        
        // Second day wave
        tempWaveHeight = json["data"]["weather"][2]["hourly"][0]["swellHeight_m"].stringValue
        secondDayWaveHeight.text = tempWaveHeight
        secondDayWaveHeightView.frame.size.height = CGFloat(Float(CellDataHelper.getHeightForWaveView(height: tempWaveHeight)))
        tempWaveHeightOffset = 100 - CellDataHelper.getHeightForWaveView(height: tempWaveHeight)
        secondDayWaveHeightView.frame = secondDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
        tempWeekDayName = json["data"]["weather"][2]["date"].stringValue
        secondDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        tempWaveDirect = json["data"]["weather"][2]["hourly"][0]["swellDir16Point"].stringValue
        secondDayWaveDirect.text = tempWaveDirect
        tempWaveSpeed = json["data"]["weather"][2]["hourly"][0]["swellPeriod_secs"].stringValue
        secondDayWaveSpeed.text = tempWaveSpeed.appending("s")
        
        // Icon
        tempWaveDirectionDegree = json["data"]["weather"][2]["hourly"][0]["swellDir"].doubleValue
        secondDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
        tempimageIcon = secondDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        secondDayWaveDirectIcon.image = tempimageIcon
        
        // Third day wave
        tempWaveHeight = json["data"]["weather"][3]["hourly"][0]["swellHeight_m"].stringValue
        thirdDayWaveHeight.text = tempWaveHeight
        thirdDayWaveHeightView.frame.size.height = CGFloat(Float(CellDataHelper.getHeightForWaveView(height: tempWaveHeight)))
        tempWaveHeightOffset = 100 - CellDataHelper.getHeightForWaveView(height: tempWaveHeight)
        thirdDayWaveHeightView.frame = thirdDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
        tempWeekDayName = json["data"]["weather"][3]["date"].stringValue
        thirdDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        tempWaveDirect = json["data"]["weather"][3]["hourly"][0]["swellDir16Point"].stringValue
        thirdDayWaveDirect.text = tempWaveDirect
        tempWaveSpeed = json["data"]["weather"][3]["hourly"][0]["swellPeriod_secs"].stringValue
        thirdDayWaveSpeed.text = tempWaveSpeed.appending("s")
        
        // Icon
        tempWaveDirectionDegree = json["data"]["weather"][3]["hourly"][0]["swellDir"].doubleValue
        thirdDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
        tempimageIcon = thirdDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        thirdDayWaveDirectIcon.image = tempimageIcon
        
        
        // Fourth day wave
        tempWaveHeight = json["data"]["weather"][4]["hourly"][0]["swellHeight_m"].stringValue
        fourthDayWaveHeight.text = tempWaveHeight
        fourthDayWaveHeightView.frame.size.height = CGFloat(Float(CellDataHelper.getHeightForWaveView(height: tempWaveHeight)))
        tempWaveHeightOffset = 100 - CellDataHelper.getHeightForWaveView(height: tempWaveHeight)
        fourthDayWaveHeightView.frame = fourthDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
        tempWeekDayName = json["data"]["weather"][4]["date"].stringValue
        fourthDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
        tempWaveDirect = json["data"]["weather"][4]["hourly"][0]["swellDir16Point"].stringValue
        fourthDayWaveDirect.text = tempWaveDirect
        tempWaveSpeed = json["data"]["weather"][4]["hourly"][0]["swellPeriod_secs"].stringValue
        fourthDayWaveSpeed.text = tempWaveSpeed.appending("s")
        
        // Icon rotation
        tempWaveDirectionDegree = json["data"]["weather"][4]["hourly"][0]["swellDir"].doubleValue
        fourthDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
        tempimageIcon = fourthDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        fourthDayWaveDirectIcon.image = tempimageIcon
    }
    
}
