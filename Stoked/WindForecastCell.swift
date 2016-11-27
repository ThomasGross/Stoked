//
//  WindForecastCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 26/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class WindForecastCell: UITableViewCell {
    
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
    
}
