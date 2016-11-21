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
                        
                        
                        //TODO
                        // More properties from model.
                        
                        //
                        //                    print("\(location.locationId)")
                        //                    print("\(location.locationName)")
                        self.locations.append(location)
                        
                        count = count + 1
                    }
                    
                    completion(self.locations)
                    
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    
    
    // Method that retrives the list of tabs in the url by a specific search
    func getLocations2(completion: @escaping (JSON) -> ()) {
        
        // get request
        Alamofire.request("http://stokedwebapi.azurewebsites.net/api/api")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    completion(json)
                    
                    
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    
    
    
    //        Alamofire.request("http://stokedapi620161110014743.azurewebsites.net/api/api").responseJSON { response in
    //            print(response.request)  // original URL request
    //            print(response.response) // HTTP URL response
    //            print(response.data)     // server data
    //            print(response.result)   // result of response serialization
    //
    //            if let JSON = response.result.value {
    //                print("JSON: \(JSON)")
    //            }
    //        }
    
    
    
}
