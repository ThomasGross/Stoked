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

class JsonService {

    var locations: [LocationModel] = []
    
    
    // Method that retrives the list of tabs in the url by a specific search
    func getLocations() -> [LocationModel] {
        
        
        
        // get request
        Alamofire.request("http://stokedapi620161110014743.azurewebsites.net/api/api").validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                for _ in json {
                    print("first object: \(json[1]["LocationLat"].stringValue)")
                    
                }
                
                
                
                
            case .failure(let error):
                print(error)
            }
        }
        
        return locations
    }



}
