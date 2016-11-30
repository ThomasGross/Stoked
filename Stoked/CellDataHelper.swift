//
//  cellDataHelper.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 30/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

class CellDataHelper {
    
    static func getDirectDegreeFromString(direction: String) -> Double {
        let direct: String = direction.uppercased()
        
        switch direct {
        case "N":
            return 0
        case "NNE":
            return 22.5
        case "NE":
            return 45
        case "ENE":
            return 67.5
        case "E":
            return 90
        case "ESE":
            return 112.5
        case "SE":
            return 135
        case "SSE":
            return 157.5
        case "S":
            return 180
        case "SSW":
            return 202.5
        case "SW":
            return 225
        case "WSW":
            return 247.5
        case "W":
            return 270
        case "WNW":
            return 292.5
        case "NW":
            return 315
        case "NNW":
            return 337.5
        default:
            return 0
        }
    }
    
    static func getHeightForWaveView(height: String) -> Double {
        let waveHeight: Double = Double(height)!
        print(waveHeight)
        
        if waveHeight <= 0.5 {
            return 30
        } else if waveHeight >= 0.5 && waveHeight <= 1.0 {
            return 40
        } else if waveHeight >= 1.0 && waveHeight <= 1.5 {
            return 50
        } else if waveHeight >= 1.5 && waveHeight <= 2.0 {
            return 60
        } else if waveHeight >= 2.0 && waveHeight <= 2.5 {
            return 70
        } else if waveHeight >= 2.5 && waveHeight <= 3.0 {
            return 80
        } else if waveHeight >= 3.0 {
            return 90
        }
        return 30
    }
    
    static func getDifficultyLevel(level: Int) -> String {
        switch (level){
        case 1:
            return "BEGINNER"
        case 2:
            return "INTERMEDIATE"
        default:
            return "EXPERT"
        }
    }
    
}
