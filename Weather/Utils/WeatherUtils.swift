//
//  WeatherUtils.swift
//  Weather
//
//  Created by Toto on 30/07/2019.
//  Copyright © 2019 Toto. All rights reserved.
//

import UIKit

struct WeatherUtils {
    
    // J'ajoute des couleurs plus neutre pour que le visuel agresse moins.
    struct Colors {
        
        /* Ancienne couleurs
        static let watermelon: UInt = 0xFF5670
        static let yellow: UInt = 0xFFCE00
        static let darkMagenta: UInt = 0xA90097
        static let greenBlue: UInt = 0x08A4A9
        */
        
        static let wine: UInt = 0x9C1E28
        static let grey: UInt = 0x5d5d5d
        static let brown: UInt = 0x824642
        static let blue: UInt = 0x326392
        
    }
    
    static func weatherColor(index pIndex:Int) -> UIColor {
        let arrayColor = [
            
            // Affectation des couleurs
            UIColor(hexString: Colors.wine),
            UIColor(hexString: Colors.grey),
            UIColor(hexString: Colors.brown),
            UIColor(hexString: Colors.blue),
            
        ]
        return arrayColor[(pIndex % arrayColor.count)]
    }
    
    /* It would be necessary to convert the date obtained in format string of the service in Date format while inserting the format of date wanted.
     Then convert the type of date to String while inserting another style. */
    static func changeDateFormat(dateString: String) -> String? {
        let stringToDateFormatter = DateFormatter()
        stringToDateFormatter.dateFormat = WeatherConstants.dateFormatter
        
        guard let date = stringToDateFormatter.date(from: dateString) else { return nil }
        
        let dateToStringFormatter = DateFormatter()
        dateToStringFormatter.locale = Locale(identifier: "fr_FR")
        dateToStringFormatter.dateStyle = .short
        dateToStringFormatter.timeStyle = .short
        
        return dateToStringFormatter.string(from: date)
    }
}
