//
//  LocationDetailViewController.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 22/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import SwiftyJSON

struct detailCellData {
    let cellId: Int!
    let cellName: String!
}

class LocationDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var locationDetailNavigationItem: UINavigationItem!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    var json: JSON!
    var location: LocationModel!
    
    var image: UIImage!
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var arrayOfCellData = [detailCellData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationDetailNavigationItem.title = location.locationName
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Arial", size: 20)!]
        
        
        image = UIImage(named: "Surf4.Foto-Gjerluff-Photography-1030x686-2")
        
        backgroundImage.image = image.applyBlurWithRadius(5, tintColor: UIColor(red:0.33, green:0.81, blue:1.00, alpha:0.1), saturationDeltaFactor: 1.8)
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        arrayOfCellData = [detailCellData(cellId: 1, cellName: "description"),
                           detailCellData(cellId: 5, cellName: "bestcondition"),
                           detailCellData(cellId: 2, cellName: "waveforecast"),
                           detailCellData(cellId: 3, cellName: "windforecast"),
                           detailCellData(cellId: 4, cellName: "weatherforecast")]
        
        detailTableView.separatorStyle = .none
        
        print(json)
        
        // Do any additional setup after loading the view.
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if arrayOfCellData[indexPath.row].cellId == 1 {
            let cell = Bundle.main.loadNibNamed("DetailDecriptionCell", owner: self, options: nil)?.first as! DetailDecriptionCell
            
            cell.populateCell(json: json, location: location)
            
            return cell
        } else if arrayOfCellData[indexPath.row].cellId == 2 {
            let cell = Bundle.main.loadNibNamed("WaveForecastCell", owner: self, options: nil)?.first as! WaveForecastCell
            
            cell.populateCell(json: json, location: location)
            
            return cell
            
        } else if arrayOfCellData[indexPath.row].cellId == 3 {
            let cell = Bundle.main.loadNibNamed("WindForecastCell", owner: self, options: nil)?.first as! WindForecastCell
            
            cell.populateCell(json: json, location: location)
            
            return cell
        
        } else if arrayOfCellData[indexPath.row].cellId == 4 {
            let cell = Bundle.main.loadNibNamed("WeatherForecastCell", owner: self, options: nil)?.first as! WeatherForecastCell
            
            cell.populateCell(json: json, location: location)
            
            return cell
        } else if arrayOfCellData[indexPath.row].cellId == 5 && location.isSurfLocation == true {
            let cell = Bundle.main.loadNibNamed("BestConditionsCell", owner: self, options: nil)?.first as! BestConditionsCell
        
            cell.populateCell(json: json, location: location)
        
            return cell
        } else {
            let cell = Bundle.main.loadNibNamed("BestConditionsCell", owner: self, options: nil)?.first as! BestConditionsCell
         
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfCellData[indexPath.row].cellId == 1 {
            return 459
        } else if arrayOfCellData[indexPath.row].cellId == 3 {
            return 238
        } else if arrayOfCellData[indexPath.row].cellId == 5 && location.isSurfLocation == true {
            return 238
        } else if arrayOfCellData[indexPath.row].cellId == 2 || arrayOfCellData[indexPath.row].cellId == 4  {
            return 379
        } else {
            return 0
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
