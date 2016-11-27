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
        
        
        image = UIImage(named: "Surf4.Foto-Gjerluff-Photography-1030x686-2")
        
        backgroundImage.image = image.applyBlurWithRadius(5, tintColor: UIColor(red:0.33, green:0.81, blue:1.00, alpha:0.1), saturationDeltaFactor: 1.8)
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        arrayOfCellData = [detailCellData(cellId: 1, cellName: "description"),
                           detailCellData(cellId: 2, cellName: "windforecast"),
                           detailCellData(cellId: 3, cellName: "weatherforecast")]
        
        print(json)
        
        // Do any additional setup after loading the view.
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var tempWeekDayName: String = ""
        
        if arrayOfCellData[indexPath.row].cellId == 1 {
            let cell = Bundle.main.loadNibNamed("DetailDecriptionCell", owner: self, options: nil)?.first as! DetailDecriptionCell
            
            cell.descriptionTextView.text = location.locationDescription
            
            return cell
        } else if arrayOfCellData[indexPath.row].cellId == 2 {
            let cell = Bundle.main.loadNibNamed("WindForecastCell", owner: self, options: nil)?.first as! WindForecastCell
            
            var tempWindDirect: String = ""
            var tempWindSpeed: String = ""
            var tempWindDirectionDegree: Double = 0.0
            var tempimageIcon: UIImage?
            
            // Todays wind
            tempWindDirect = json["data"]["weather"][0]["hourly"][0]["winddir16Point"].stringValue
            cell.currentWindDirection.text = tempWindDirect
            tempWindSpeed = json["data"]["weather"][0]["hourly"][0]["windspeedKmph"].stringValue
            cell.currentWindSpeed.text = tempWindSpeed
            
            // Icon rotation
            tempWindDirectionDegree = json["data"]["weather"][0]["hourly"][0]["winddirDegree"].doubleValue
            print(tempWindDirectionDegree)
            cell.currentWindDirectionIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
            tempimageIcon = cell.currentWindDirectionIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.currentWindDirectionIcon.image = tempimageIcon
            
            // First day wind
            tempWeekDayName = json["data"]["weather"][1]["date"].stringValue
            cell.firstDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            tempWindDirect = json["data"]["weather"][1]["hourly"][0]["winddir16Point"].stringValue
            cell.firstDayWindDirection.text = tempWindDirect
            tempWindSpeed = json["data"]["weather"][1]["hourly"][0]["windspeedKmph"].stringValue
            cell.firstDayWindSpeed.text = tempWindSpeed
            
            // Icon
            tempWindDirectionDegree = json["data"]["weather"][1]["hourly"][0]["winddirDegree"].doubleValue
            print(tempWindDirectionDegree)
            cell.firstDayWindIDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
            tempimageIcon = cell.firstDayWindIDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.firstDayWindIDirectIcon.image = tempimageIcon
            
            
            // Second day wind
            tempWeekDayName = json["data"]["weather"][2]["date"].stringValue
            cell.secondDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            tempWindDirect = json["data"]["weather"][2]["hourly"][0]["winddir16Point"].stringValue
            cell.secondDayWindDirect.text = tempWindDirect
            tempWindSpeed = json["data"]["weather"][2]["hourly"][0]["windspeedKmph"].stringValue
            cell.secondDayWindSpeed.text = tempWindSpeed
            
            // Icon
            tempWindDirectionDegree = json["data"]["weather"][2]["hourly"][0]["winddirDegree"].doubleValue
            print(tempWindDirectionDegree)
            cell.secondDayWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
            tempimageIcon = cell.secondDayWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.secondDayWindDirectIcon.image = tempimageIcon
            
            // Third day wind
            tempWeekDayName = json["data"]["weather"][3]["date"].stringValue
            cell.thirdDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            tempWindDirect = json["data"]["weather"][3]["hourly"][0]["winddir16Point"].stringValue
            cell.thirdDayWindDirect.text = tempWindDirect
            tempWindSpeed = json["data"]["weather"][3]["hourly"][0]["windspeedKmph"].stringValue
            cell.thirdDayWindSpeed.text = tempWindSpeed
            
            // Icon
            tempWindDirectionDegree = json["data"]["weather"][3]["hourly"][0]["winddirDegree"].doubleValue
            print(tempWindDirectionDegree)
            cell.thirdDayWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
            tempimageIcon = cell.thirdDayWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.thirdDayWindDirectIcon.image = tempimageIcon
            
            
            // Fourth day wind
            tempWeekDayName = json["data"]["weather"][4]["date"].stringValue
            cell.fourthDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            
            tempWindDirect = json["data"]["weather"][4]["hourly"][0]["winddir16Point"].stringValue
            cell.fourthDayWindDirect.text = tempWindDirect
            tempWindSpeed = json["data"]["weather"][4]["hourly"][0]["windspeedKmph"].stringValue
            cell.fourthDayWindSpeed.text = tempWindSpeed
            
            // Icon rotation
            tempWindDirectionDegree = json["data"]["weather"][4]["hourly"][0]["winddirDegree"].doubleValue
            print(tempWindDirectionDegree)
            cell.fourthDayWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
            tempimageIcon = cell.fourthDayWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.fourthDayWindDirectIcon.image = tempimageIcon
            
            

            
            
            return cell
        
        } else if arrayOfCellData[indexPath.row].cellId == 3 {
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
            return 459
        } else if arrayOfCellData[indexPath.row].cellId == 2 {
            return 238
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
