//
//  BestConditionsCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 29/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class BestConditionsCell: UITableViewCell {

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
