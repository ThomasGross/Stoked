//
//  JsonService.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 15/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class JsonLocationService {
    
    var locations: [LocationModel] = []
    
    
    // Method that retrives the list of tabs in the url by a specific search
    func getLocations(completion: @escaping ([LocationModel]) -> ()) {
        
        // get request
        Alamofire.request("http://stokedwebapi.azurewebsites.net/api/api")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    var count = 0
                    
                    for _ in json {
                        
                        let location = LocationModel()
                        
                        location.locationId = json[count]["LocationId"].int!
                        location.locationName = json[count]["LocationName"].string!
                        location.locationLong = json[count]["LocationLong"].double!
                        location.locationLat = json[count]["LocationLat"].double!
                        location.locationDescription = json[count]["LocationDescription"].string!
                        location.isSurfLocation = json[count]["IsSurfLocation"].bool!
                        location.isSUPLocation = json[count]["IsSUPLocation"].bool!
                        location.isWhiteWaterLocation = json[count]["IsWhiteWaterLocation"].bool!
                        location.creationDate = json[count]["CreationDate"].string!
                        location.surfDifficulty = json[count]["SurfDifficulty"].int!
                        location.supDifficulty = json[count]["SUPDifficulty"].int!
                        location.whiteWaterDifficulty = json[count]["WhiteWaterDifficulty"].int!
                        location.showLocation = json[count]["showLocation"].bool!
                        location.bestWindDirection = json[count]["BestWindDirection"].string!
                        location.bestWindSpeed = json[count]["BestWindSpeed"].double!
                        location.bestWaveDirection = json[count]["BestWaveDirection"].string!
                        location.bestWaveHeight = json[count]["BestWaveHeight"].double!
                        
                        
                        //TODO
                        // More properties from model.
                        
                        self.locations.append(location)
                        
                        count = count + 1
                    }
                    
                    completion(self.locations)
                    
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}
