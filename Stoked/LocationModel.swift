//
//  LocationModel.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 15/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

class LocationModel {

    //Location ID
    var locationId: Int = 0
    //Location name
    var locationName: String = ""
    //Location latitude
    var locationLat: Double = 0.0
    //Location longitude
    var locationLong: Double = 0.0
    //Location description
    var locationDescription: String = ""
    //Type of sports at location
    var isSurfLocation: Bool = false
    var isSUPLocation: Bool = false
    var isWhiteWaterLocation: Bool = false
    //Show location on map
    var showLocation: Bool = false
    //Creation date
    var creationDate: String = ""
    //Difficulty
    var surfDifficulty: Int = 0
    var supDifficulty: Int = 0
    var whiteWaterDifficulty: Int = 0
    
    // TODO:
    
    //Imagedata
//    var ImgData ImageData { get; set; }
    //Best surf conditions
//    public double BestWindSpeed { get; set; }
//    public string BestWindDirection { get; set; }
//    public double BestWaveHeight { get; set; }
//    public string BestWaveDirection { get; set; }
    //Created by
//    public string AspUserId { get; set; }
//    public string FullName { get; set; }
    
    
    init(locationId: Int, locationName: String, locationLat: Double, locationLong: Double, locationDescription: String, isSurfLocation: Bool, isSUPLocation: Bool, isWhiteWaterLocation: Bool, showLocation: Bool, creationDate: String, surfDifficulty: Int, supDifficulty: Int, whiteWaterDifficulty: Int) {
        self.locationId = locationId
        self.locationName = locationName
        self.locationLat = locationLat
        self.locationLong = locationLong
        self.locationDescription = locationDescription
        self.isSurfLocation = isSurfLocation
        self.isSUPLocation = isSUPLocation
        self.isWhiteWaterLocation = isWhiteWaterLocation
        self.showLocation = showLocation
        self.creationDate = creationDate
        self.surfDifficulty = surfDifficulty
        self.supDifficulty = supDifficulty
        self.whiteWaterDifficulty = whiteWaterDifficulty
    }
    
    
    init() {
    }
    

    
}
