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

    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var json: JSON!
    var location: LocationModel!
    
    var image: UIImage!
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var arrayOfCellData = [detailCellData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = UIImage(named: "Surf4.Foto-Gjerluff-Photography-1030x686-2")
        
        backgroundImage.image = image.applyBlurWithRadius(5, tintColor: UIColor(red:0.33, green:0.81, blue:1.00, alpha:0.1), saturationDeltaFactor: 1.8)
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        arrayOfCellData = [detailCellData(cellId: 1, cellName: "description"),
                           detailCellData(cellId: 2, cellName: "weatherforecast")]
        
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
            
            cell.descriptionTextView.text = location.locationDescription
            
            return cell
        } else if arrayOfCellData[indexPath.row].cellId == 2 {
            let cell = Bundle.main.loadNibNamed("WeatherForecastCell", owner: self, options: nil)?.first as! WeatherForecastCell
            
            // Current weather
            var txt: String = ""
            
            txt = json["data"]["weather"][0]["hourly"][0]["tempC"].stringValue
            cell.currentWeatherLabel.text = txt
            txt = json["data"]["weather"][0]["hourly"][0]["precipMM"].stringValue
            cell.precipitation.text = txt
            txt = json["data"]["weather"][0]["hourly"][0]["weatherDesc"][0]["value"].stringValue
            cell.weatherDecription.text = txt.uppercased()
            
            
            var tempMin: String = ""
            var tempMax: String = ""
            
            var tempWeekDayName: String = ""
            
            // First day weather
            tempMin = json["data"]["weather"][1]["mintempC"].stringValue
            tempMax = json["data"]["weather"][1]["maxtempC"].stringValue
            cell.firstDayTemp.text = "\(tempMin)-\(tempMax)°"
            
            tempWeekDayName = json["data"]["weather"][1]["date"].stringValue
            cell.firstWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            // Second day weather
            tempMin = json["data"]["weather"][2]["mintempC"].stringValue
            tempMax = json["data"]["weather"][2]["maxtempC"].stringValue
            cell.secondDayTemp.text = "\(tempMin)-\(tempMax)°"
            
            tempWeekDayName = json["data"]["weather"][2]["date"].stringValue
            cell.secondWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)

            // Third day weather
            tempMin = json["data"]["weather"][3]["mintempC"].stringValue
            tempMax = json["data"]["weather"][3]["maxtempC"].stringValue
            cell.thirdDayTemp.text = "\(tempMin)-\(tempMax)°"
            
            tempWeekDayName = json["data"]["weather"][3]["date"].stringValue
            cell.thirdWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            // Fourth day weather
            tempMin = json["data"]["weather"][4]["mintempC"].stringValue
            tempMax = json["data"]["weather"][4]["maxtempC"].stringValue
            cell.fourthDayTemp.text = "\(tempMin)-\(tempMax)°"
            
            tempWeekDayName = json["data"]["weather"][4]["date"].stringValue
            cell.fourthWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            // Fifth day weather
            tempMin = json["data"]["weather"][5]["mintempC"].stringValue
            tempMax = json["data"]["weather"][5]["maxtempC"].stringValue
            cell.fifthDayTemp.text = "\(tempMin)-\(tempMax)°"
            
            tempWeekDayName = json["data"]["weather"][5]["date"].stringValue
            cell.fifthWeekdayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            
            
            return cell
        } else {
        
            let cell = Bundle.main.loadNibNamed("DetailDecriptionCell", owner: self, options: nil)?.first as! DetailDecriptionCell
         
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfCellData[indexPath.row].cellId == 1 {
            return 379
        } else {
            return 379
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
