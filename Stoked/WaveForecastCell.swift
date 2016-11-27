//
//  WaveForecastCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 27/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class WaveForecastCell: UITableViewCell {
    
    // Today
    @IBOutlet weak var currentWaveHeight: UILabel!
    @IBOutlet weak var currentWaveDirection: UILabel!
    @IBOutlet weak var currentWaveDirectionIcon: UIImageView!
    @IBOutlet weak var currentWaveSpeed: UILabel!
    
    // First day
    @IBOutlet weak var firstDayWaveHeight: UILabel!
    @IBOutlet weak var firstDayWaveDirection: UILabel!
    @IBOutlet weak var firstDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var firstDayWaveSpeed: UILabel!
    @IBOutlet weak var firstDayName: UILabel!
    
    // Second day
    @IBOutlet weak var secondDayWaveHeight: UILabel!
    @IBOutlet weak var secondDayWaveDirect: UILabel!
    @IBOutlet weak var secondDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var secondDayWaveSpeed: UILabel!
    @IBOutlet weak var secondDayName: UILabel!
    
    // Third day
    @IBOutlet weak var thirdDayWaveHeight: UILabel!
    @IBOutlet weak var thirdDayWaveDirect: UILabel!
    @IBOutlet weak var thirdDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var thirdDayWaveSpeed: UILabel!
    @IBOutlet weak var thirdDayName: UILabel!
    
    // Fourth day
    @IBOutlet weak var fourthDayWaveHeight: UILabel!
    @IBOutlet weak var fourthDayWaveDirect: UILabel!
    @IBOutlet weak var fourthDayWaveDirectIcon: UIImageView!
    @IBOutlet weak var fourthDayWaveSpeed: UILabel!
    @IBOutlet weak var fourthDayName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
