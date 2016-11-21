//
//  CustomAnnotationModel.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 17/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CustomAnnotationModel: MKPointAnnotation {
    
    var locationId: Int!
    var locationName: String!
    var locationCategories: String!
    var locationCurrentConditions: String!

    
    override init() {
        
    }
}
