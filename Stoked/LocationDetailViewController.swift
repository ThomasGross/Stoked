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
                           detailCellData(cellId: 5, cellName: "bestcondition"),
                           detailCellData(cellId: 2, cellName: "waveforecast"),
                           detailCellData(cellId: 3, cellName: "windforecast"),
                           detailCellData(cellId: 4, cellName: "weatherforecast")]
        
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
        var tempimageIcon: UIImage?
        
        if arrayOfCellData[indexPath.row].cellId == 1 {
            let cell = Bundle.main.loadNibNamed("DetailDecriptionCell", owner: self, options: nil)?.first as! DetailDecriptionCell
            
            cell.descriptionTextView.text = location.locationDescription
            
            if location.isSurfLocation {
                cell.surfDiffValue.text = getDifficultyLevel(level: location.surfDifficulty)
            } else {
                cell.surfDiffValue.text = "N/A"
                cell.surfDiffValue.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
                cell.surfDiffName.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
            }
            if location.isSUPLocation {
                cell.supDiffValue.text = getDifficultyLevel(level: location.supDifficulty)
            } else {
                cell.supDiffValue.text = "N/A"
                cell.supDiffValue.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
                cell.supDiffName.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
            }
            if location.isWhiteWaterLocation {
                cell.wwDiffValue.text = getDifficultyLevel(level: location.whiteWaterDifficulty)
            } else {
                cell.wwDiffValue.text = "N/A"
                cell.wwDiffValue.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
                cell.wwDiffName.textColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0)
            }
            
            return cell
        } else if arrayOfCellData[indexPath.row].cellId == 2 {
            let cell = Bundle.main.loadNibNamed("WaveForecastCell", owner: self, options: nil)?.first as! WaveForecastCell
        
            var tempWaveHeight: String = ""
            var tempWaveDirect: String = ""
            var tempWaveSpeed: String = ""
            var tempWaveDirectionDegree: Double = 0.0
            var tempWaveHeightOffset: Double = 0.0

            // Todays wave
            tempWaveHeight = json["data"]["weather"][0]["hourly"][0]["swellHeight_m"].stringValue
            cell.currentWaveHeight.text = tempWaveHeight
            cell.currentWaveHeightView.frame.size.height = CGFloat(Float(getHeightForWaveView(height: tempWaveHeight)))
            tempWaveHeightOffset = 100 - getHeightForWaveView(height: tempWaveHeight)
            cell.currentWaveHeightView.frame = cell.currentWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
            
            tempWaveDirect = json["data"]["weather"][0]["hourly"][0]["swellDir16Point"].stringValue
            cell.currentWaveDirection.text = tempWaveDirect
            tempWaveSpeed = json["data"]["weather"][0]["hourly"][0]["swellPeriod_secs"].stringValue
            cell.currentWaveSpeed.text = tempWaveSpeed.appending("s")
            
            // Icon rotation
            tempWaveDirectionDegree = json["data"]["weather"][0]["hourly"][0]["swellDir"].doubleValue
            print(tempWaveDirectionDegree)
            cell.currentWaveDirectionIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
            tempimageIcon = cell.currentWaveDirectionIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.currentWaveDirectionIcon.image = tempimageIcon
            
            // First day wave
            tempWaveHeight = json["data"]["weather"][1]["hourly"][0]["swellHeight_m"].stringValue
            cell.firstDayWaveHeight.text = tempWaveHeight
            cell.firstDayWaveHeightView.frame.size.height = CGFloat(Float(getHeightForWaveView(height: tempWaveHeight)))
            tempWaveHeightOffset = 100 - getHeightForWaveView(height: tempWaveHeight)
            cell.firstDayWaveHeightView.frame = cell.firstDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
            tempWeekDayName = json["data"]["weather"][1]["date"].stringValue
            cell.firstDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            tempWaveDirect = json["data"]["weather"][1]["hourly"][0]["swellDir16Point"].stringValue
            cell.firstDayWaveDirection.text = tempWaveDirect
            tempWaveSpeed = json["data"]["weather"][1]["hourly"][0]["swellPeriod_secs"].stringValue
            cell.firstDayWaveSpeed.text = tempWaveSpeed.appending("s")
            
            // Icon
            tempWaveDirectionDegree = json["data"]["weather"][1]["hourly"][0]["swellDir"].doubleValue
            print(tempWaveDirectionDegree)
            cell.firstDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
            tempimageIcon = cell.firstDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.firstDayWaveDirectIcon.image = tempimageIcon
            
            
            // Second day wave
            tempWaveHeight = json["data"]["weather"][2]["hourly"][0]["swellHeight_m"].stringValue
            cell.secondDayWaveHeight.text = tempWaveHeight
            cell.secondDayWaveHeightView.frame.size.height = CGFloat(Float(getHeightForWaveView(height: tempWaveHeight)))
            tempWaveHeightOffset = 100 - getHeightForWaveView(height: tempWaveHeight)
            cell.secondDayWaveHeightView.frame = cell.secondDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
            tempWeekDayName = json["data"]["weather"][2]["date"].stringValue
            cell.secondDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            tempWaveDirect = json["data"]["weather"][2]["hourly"][0]["swellDir16Point"].stringValue
            cell.secondDayWaveDirect.text = tempWaveDirect
            tempWaveSpeed = json["data"]["weather"][2]["hourly"][0]["swellPeriod_secs"].stringValue
            cell.secondDayWaveSpeed.text = tempWaveSpeed.appending("s")
            
            // Icon
            tempWaveDirectionDegree = json["data"]["weather"][2]["hourly"][0]["swellDir"].doubleValue
            print(tempWaveDirectionDegree)
            cell.secondDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
            tempimageIcon = cell.secondDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.secondDayWaveDirectIcon.image = tempimageIcon
            
            // Third day wave
            tempWaveHeight = json["data"]["weather"][3]["hourly"][0]["swellHeight_m"].stringValue
            cell.thirdDayWaveHeight.text = tempWaveHeight
            cell.thirdDayWaveHeightView.frame.size.height = CGFloat(Float(getHeightForWaveView(height: tempWaveHeight)))
            tempWaveHeightOffset = 100 - getHeightForWaveView(height: tempWaveHeight)
            cell.thirdDayWaveHeightView.frame = cell.thirdDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
            tempWeekDayName = json["data"]["weather"][3]["date"].stringValue
            cell.thirdDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            tempWaveDirect = json["data"]["weather"][3]["hourly"][0]["swellDir16Point"].stringValue
            cell.thirdDayWaveDirect.text = tempWaveDirect
            tempWaveSpeed = json["data"]["weather"][3]["hourly"][0]["swellPeriod_secs"].stringValue
            cell.thirdDayWaveSpeed.text = tempWaveSpeed.appending("s")
            
            // Icon
            tempWaveDirectionDegree = json["data"]["weather"][3]["hourly"][0]["swellDir"].doubleValue
            print(tempWaveDirectionDegree)
            cell.thirdDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
            tempimageIcon = cell.thirdDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.thirdDayWaveDirectIcon.image = tempimageIcon
            
            
            // Fourth day wave
            tempWaveHeight = json["data"]["weather"][4]["hourly"][0]["swellHeight_m"].stringValue
            cell.fourthDayWaveHeight.text = tempWaveHeight
            cell.fourthDayWaveHeightView.frame.size.height = CGFloat(Float(getHeightForWaveView(height: tempWaveHeight)))
            tempWaveHeightOffset = 100 - getHeightForWaveView(height: tempWaveHeight)
            cell.fourthDayWaveHeightView.frame = cell.fourthDayWaveHeightView.frame.offsetBy( dx: 0, dy: CGFloat(tempWaveHeightOffset));
            tempWeekDayName = json["data"]["weather"][4]["date"].stringValue
            cell.fourthDayName.text = Date().getDayOfWeek(today: tempWeekDayName)
            tempWaveDirect = json["data"]["weather"][4]["hourly"][0]["swellDir16Point"].stringValue
            cell.fourthDayWaveDirect.text = tempWaveDirect
            tempWaveSpeed = json["data"]["weather"][4]["hourly"][0]["swellPeriod_secs"].stringValue
            cell.fourthDayWaveSpeed.text = tempWaveSpeed.appending("s")
            
            // Icon rotation
            tempWaveDirectionDegree = json["data"]["weather"][4]["hourly"][0]["swellDir"].doubleValue
            print(tempWaveDirectionDegree)
            cell.fourthDayWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
            tempimageIcon = cell.fourthDayWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.fourthDayWaveDirectIcon.image = tempimageIcon
            
            
            return cell
            
        } else if arrayOfCellData[indexPath.row].cellId == 3 {
            let cell = Bundle.main.loadNibNamed("WindForecastCell", owner: self, options: nil)?.first as! WindForecastCell
            
            var tempWindDirect: String = ""
            var tempWindSpeed: String = ""
            var tempWindDirectionDegree: Double = 0.0
            
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
        
        } else if arrayOfCellData[indexPath.row].cellId == 4 {
            let cell = Bundle.main.loadNibNamed("WeatherForecastCell", owner: self, options: nil)?.first as! WeatherForecastCell
            
            // Current weather
            var txt: String = ""
            var tempIntMin: Double = 0.0
            var tempIntMax: Double = 0.0
            var result: Double = 0.0
            
            tempIntMin = json["data"]["weather"][0]["mintempC"].doubleValue
            tempIntMax = json["data"]["weather"][0]["maxtempC"].doubleValue
            
            print(tempIntMin)
            print(tempIntMax)
            
            result = Double((tempIntMin + tempIntMax) / 2)
            cell.currentWeatherLabel.text = "\(result)°"
            txt = json["data"]["weather"][0]["hourly"][0]["precipMM"].stringValue
            cell.precipitation.text = txt.appending("% PRECIPITATION")
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
        } else if arrayOfCellData[indexPath.row].cellId == 5 && location.isSurfLocation == true {
            let cell = Bundle.main.loadNibNamed("BestConditionsCell", owner: self, options: nil)?.first as! BestConditionsCell
        
            var tempWindDirectionDegree: Double = 0.0
            var tempWaveDirectionDegree: Double = 0.0
            
            
            cell.bestWindDirectLabel.text = location.bestWindDirection
            cell.bestWindDirectName.text = "WIND\nDIRECTION"
            cell.bestWindSpeedValue.text = "\(location.bestWindSpeed)"
            cell.bestWindSpeedName.text = "WIND\nSPEED"
            
            
            cell.bestWaveDirectLabel.text = location.bestWaveDirection
            cell.bestWaveDirectName.text = "WAVE\nDIRECTION"
            cell.bestWaveHeightLabel.text = "\(location.bestWaveHeight)"
            cell.bestWaveHeightName.text = "WAVE\nHEIGHT"
            
            // Icons
            tempWindDirectionDegree = getDirectDegreeFromString(direction: location.bestWindDirection)
            cell.bestWindDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWindDirectionDegree * M_PI/180))
            tempimageIcon = cell.bestWindDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.bestWindDirectIcon.image = tempimageIcon
            
            tempWaveDirectionDegree = getDirectDegreeFromString(direction: location.bestWaveDirection)
            cell.bestWaveDirectIcon.transform = CGAffineTransform(rotationAngle: CGFloat(tempWaveDirectionDegree * M_PI/180))
            tempimageIcon = cell.bestWaveDirectIcon.image?.imageWithColor(color: UIColor(red:0.69, green:0.81, blue:0.86, alpha:1.0))
            cell.bestWaveDirectIcon.image = tempimageIcon
            
            
            return cell
        } else {
            let cell = Bundle.main.loadNibNamed("BestConditionsCell", owner: self, options: nil)?.first as! BestConditionsCell
         
            return cell
        }
    }
    
    func getHeightForWaveView(height: String) -> Double {
        let waveHeight: Double = Double(height)!
        print(waveHeight)
        
        if waveHeight <= 0.5 {
            return 30
        } else if waveHeight >= 0.5 && waveHeight <= 1.0 {
            return 40
        } else if waveHeight >= 1.0 && waveHeight <= 1.5 {
            return 50
        } else if waveHeight >= 1.5 && waveHeight <= 2.0 {
            return 60
        } else if waveHeight >= 2.0 && waveHeight <= 2.5 {
            return 70
        } else if waveHeight >= 2.5 && waveHeight <= 3.0 {
            return 80
        } else if waveHeight >= 3.0 {
            return 90
        }
        return 30
    }
    
    func getDirectDegreeFromString(direction: String) -> Double {
        let direct: String = direction.uppercased()
        
        switch direct {
        case "N":
            return 0
        case "NNE":
            return 22.5
        case "NE":
            return 45
        case "ENE":
            return 67.5
        case "E":
            return 90
        case "ESE":
            return 112.5
        case "SE":
            return 135
        case "SSE":
            return 157.5
        case "S":
            return 180
        case "SSW":
            return 202.5
        case "SW":
            return 225
        case "WSW":
            return 247.5
        case "W":
            return 270
        case "WNW":
            return 292.5
        case "NW":
            return 315
        case "NNW":
            return 337.5
        default:
            return 0
        }
    }
    
    func getDifficultyLevel(level: Int) -> String {
        switch (level){
        case 1:
            return "BEGINNER"
        case 2:
            return "INTERMEDIATE"
        default:
            return "EXPERT"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
