//
//  DateExtension.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 25/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

extension Date {
    //Date String Helper Functions
    func getDayOfWeek(today:String)->String? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.date(from: today) {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
            let myComponents = myCalendar.components(.weekday, from: todayDate)
            let weekDay = myComponents.weekday
            if weekDay == 1 {
                return "SUN"
            } else if weekDay == 2 {
                return "MON"
            } else if weekDay == 3 {
                return "TUE"
            } else if weekDay == 4 {
                return "WED"
            } else if weekDay == 5 {
                return "THU"
            } else if weekDay == 6 {
                return "FRI"
            } else if weekDay == 7 {
                return "SAT"
            } else {
                return ""
            }

            
//            switch weekDay {
//            case 1:
//                return "Sun"
//            case 2:
//                return "Mon"
//            case 3:
//                return "Tue"
//            case 4:
//                return "Wed"
//            case 5:
//                return "Thu"
//            case 6:
//                return "Fri"
//            case 7:
//                return "Sat"
//            default:
//                print("Error fetching days")
//                return "Day"
//            }
//        } else {
//            return ""
//        }
            
        }
        else {
            return ""
        }
    }

}
