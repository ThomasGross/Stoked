//
//  SlideMenuTableViewController.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 10/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import Foundation


struct cellData {
    let cellId: Int!
    let text: String!
    let image: UIImage!
}

class SlideMenuTableViewController: UITableViewController {
    
    
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        
        arrayOfCellData = [cellData(cellId: 1, text: "", image:  #imageLiteral(resourceName: "STOKED_LOGO_COLOUR_RGB")),
                           cellData(cellId: 2, text: "Locations", image: #imageLiteral(resourceName: "location-arrow-icon-64986")),
                           cellData(cellId: 2, text: "Events", image: #imageLiteral(resourceName: "Planner")),
                           cellData(cellId: 2, text: "Newsfeed", image: #imageLiteral(resourceName: "More"))]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfCellData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if arrayOfCellData[indexPath.row].cellId == 1 {
            let cell = Bundle.main.loadNibNamed("SlideMenuTopCell", owner: self, options: nil)?.first as! SlideMenuTopCell
            
            cell.stokedLogo.image = arrayOfCellData[indexPath.row].image
            
            return cell
        } else if arrayOfCellData[indexPath.row].cellId == 2 {
            let cell = Bundle.main.loadNibNamed("SlideMenuItemCell", owner: self, options: nil)?.first as! SlideMenuItemCell
            
            cell.cellImage.image = arrayOfCellData[indexPath.row].image
            
            cell.cellLabel.text = arrayOfCellData[indexPath.row].text
            
            
            return cell
            
        } else {
        
            let cell = Bundle.main.loadNibNamed("SlideMenuItemCell", owner: self, options: nil)?.first as! SlideMenuItemCell
            
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfCellData[indexPath.row].cellId == 1 {
            return 140
        } else if arrayOfCellData[indexPath.row].cellId == 2 {
            return 45
        } else {
            return 45
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if arrayOfCellData[indexPath.row].cellId != 1 {
            if arrayOfCellData[indexPath.row].text == "Locations" {
                performSegue(withIdentifier: "segueToMapView", sender: self)
                
            } else if arrayOfCellData[indexPath.row].text == "Events" {
                performSegue(withIdentifier: "segueToEventView", sender: self)
                
            } else if arrayOfCellData[indexPath.row].text == "Newsfeed" {
                performSegue(withIdentifier: "segueToNewsView", sender: self)
            }
            
        }
    }

}
