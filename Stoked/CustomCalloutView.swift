//
//  CustomCalloutView.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 21/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import SwiftyJSON

class CustomCalloutView: UIView {

    @IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var locationCategories: UILabel!
    
    @IBOutlet weak var locationCurrentConditions: UILabel!
    
    @IBOutlet weak var locationTempAir: UILabel!
    
    @IBOutlet weak var locationWindSpeed: UILabel!
    
    @IBOutlet weak var locationWindDirection: UILabel!
    
    @IBOutlet weak var locationWaveHight: UILabel!
    
    @IBOutlet weak var locationWaveDirection: UILabel!
    
    @IBOutlet weak var locationTempWater: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    
    
    
    func setup() {
        super.layer.borderWidth = 0.3
        super.layer.borderColor = UIColor(red:0.22, green:0.22, blue:0.22, alpha:0.7).cgColor
        super.layer.backgroundColor = UIColor.clear.cgColor
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func draw(_ rect: CGRect) {
        
        let aPath = UIBezierPath()
        let strokeColor = UIColor(red:0.22, green:0.22, blue:0.22, alpha:0.7)
        
        aPath.lineWidth = 0.3
        aPath.move(to: CGPoint(x: 0, y: 88))
        aPath.addLine(to: CGPoint(x: 320, y: 88))
        aPath.close()
        strokeColor.setStroke()
        aPath.stroke()
    
    }
    
    func getlocationDetails(location: LocationModel, json: JSON) {
        
        locationName.text = location.locationName
        
        locationCurrentConditions.text = location.locationDescription
        
        locationCategories.text = ""
        if (location.isSurfLocation == true){
            locationCategories.text?.append("SURF")
        }
        if (location.isSUPLocation == true){
            if locationCategories.text != "" {
                locationCategories.text?.append(" · ")
            }
            locationCategories.text?.append("SUP")
        }
        if (location.isWhiteWaterLocation == true){
            if locationCategories.text != "" {
                locationCategories.text?.append(" · ")
            }
            locationCategories.text?.append("WHITE WATER")
        }
        
        var tempString: String = ""
        tempString = json["data"]["weather"][0]["hourly"][0]["weatherDesc"][0]["value"].stringValue
        locationCurrentConditions.text = tempString.uppercased()
        tempString = json["data"]["weather"][0]["hourly"][0]["tempC"].stringValue
        tempString.append("°")
        locationTempAir.text = tempString
        tempString = json["data"]["weather"][0]["hourly"][0]["windspeedKmph"].stringValue
        tempString.append("Kmph")
        locationWindSpeed.text = tempString
        tempString = json["data"]["weather"][0]["hourly"][0]["winddir16Point"].stringValue
        locationWindDirection.text = tempString
        tempString = json["data"]["weather"][0]["hourly"][0]["swellHeight_m"].stringValue
        tempString.append("m")
        locationWaveHight.text = tempString
        tempString = json["data"]["weather"][0]["hourly"][0]["swellDir16Point"].stringValue
        locationWaveDirection.text = tempString
        tempString = json["data"]["weather"][0]["hourly"][0]["waterTemp_C"].stringValue
        tempString.append("°")
        locationTempWater.text = tempString
        
        
    }

}
