//
//  LocationCellProtocol.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 30/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol LocationCellProtocol {
    func populateCell(json: JSON, location: LocationModel)
}
