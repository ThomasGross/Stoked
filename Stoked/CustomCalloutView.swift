//
//  CustomCalloutView.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 21/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

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

}
