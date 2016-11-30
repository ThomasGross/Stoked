//
//  BestConditionsCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 29/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import SwiftyJSON

class BestConditionsCell: UITableViewCell, LocationCellProtocol {

    @IBOutlet weak var bestWindDirectIcon: UIImageView!
    @IBOutlet weak var bestWindDirectLabel: UILabel!
    @IBOutlet weak var bestWindDirectName: UILabel!
    
    @IBOutlet weak var bestWindSpeedValue: UILabel!
    @IBOutlet weak var bestWindSpeedName: UILabel!
    
    @IBOutlet weak var bestWaveDirectIcon: UIImageView!
    @IBOutlet weak var bestWaveDirectLabel: UILabel!
    @IBOutlet weak var bestWaveDirectName: UILabel!
    
    @IBOutlet weak var bestWaveHeightLabel: UILabel!
    @IBOutlet weak var bestWaveHeightName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension BestConditionsCell {
    
    func populateCell(json: JSON, location: LocationModel) {
        var tempWindDirectionDegree: Double = 0.0
        var tempWaveDirectionDegree: Double = 0.0
        var tempimageIcon: UIImage?
        
        
        bestWindDirectLabel.text = location.bestWindDirection
        bestWindDirectName.text = "WIND\nDIRECTION"
        bestWindSpeedValue.text = "\(location.bestWindSpeed)"
        bestWindSpeedName.text = "WIND\nSPEED"
        
        
        bestWaveDirectLabel.text = location.bestWaveDirection
        bestWaveDirectName.text = "WAVE\nDIRECTION"
        bestWaveHeightLabel.text = "\(location.bestWaveHeight)"
        bestWaveHeightName.text = "WAVE\nHEIGHT"
        
        // Icons
        tempWindDirectionDegree = CellDataHelper.getDirectDegreeFromString(direction: location.bestWindDirection)
        bestWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
        tempimageIcon = bestWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        bestWindDirectIcon.image = tempimageIcon
        
        tempWaveDirectionDegree = CellDataHelper.getDirectDegreeFromString(direction: location.bestWaveDirection)
        bestWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
        tempimageIcon = bestWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
        bestWaveDirectIcon.image = tempimageIcon
    }
    

}
