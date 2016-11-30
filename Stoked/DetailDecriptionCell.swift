//
//  DetailDecriptionCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 24/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailDecriptionCell: UITableViewCell, LocationCellProtocol {

    @IBOutlet weak var descriptionTextView: UITextView!

    @IBOutlet weak var surfDiffName: UILabel!
    @IBOutlet weak var surfDiffValue: UILabel!
    
    @IBOutlet weak var supDiffName: UILabel!
    @IBOutlet weak var supDiffValue: UILabel!
    
    @IBOutlet weak var wwDiffName: UILabel!
    @IBOutlet weak var wwDiffValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(json: JSON, location: LocationModel) {
        
        descriptionTextView.text = location.locationDescription
        
        if location.isSurfLocation {
            surfDiffValue.text = CellDataHelper.getDifficultyLevel(level: location.surfDifficulty)
        } else {
            surfDiffValue.text = "N/A"
            surfDiffValue.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
            surfDiffName.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
        }
        if location.isSUPLocation {
            supDiffValue.text = CellDataHelper.getDifficultyLevel(level: location.supDifficulty)
        } else {
            supDiffValue.text = "N/A"
            supDiffValue.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
            supDiffName.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
        }
        if location.isWhiteWaterLocation {
            wwDiffValue.text = CellDataHelper.getDifficultyLevel(level: location.whiteWaterDifficulty)
        } else {
            wwDiffValue.text = "N/A"
            wwDiffValue.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
            wwDiffName.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
        }
        
    }
    
}
