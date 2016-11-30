//
//  DetailDecriptionCell.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 24/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class DetailDecriptionCell: UITableViewCell {

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
    
}
