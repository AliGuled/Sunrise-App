//
//  SunTimes.swift
//  Sunrise
//
//  Created by Guled Ali on 4/8/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation

//Result decodable
struct Results: Decodable {
    let results: SunTimes
    
}

//suntimes decodable
struct SunTimes: Decodable {
    let sunrise: String
    let sunset: String
    let location:  String
    

    //Source: https://stackoverflow.com/questions/49675026/coding-key-difficulties-with-json-swift-4-1
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
   
    }
}

//SunTimes extension
extension SunTimes {
    
    //UTC date formater
    static let utcDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "hh:mm:ss a"
        df.timeZone = TimeZone(abbreviation: "UTC")
        return df
    }()
    
    //Date formater with medium time style
    static let localDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.calendar = NSCalendar.current
        df.timeZone = TimeZone.current
        df.timeStyle = .medium
        return df
        
    }()

    init(from decoder: Decoder) {
        
        //turn string to local dates
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let sunriseUTCString = try! container.decode(String.self, forKey: CodingKeys.sunrise)
        let sunsetUTCString = try! container.decode(String.self, forKey: CodingKeys.sunset)
       
    
        
        // convert to timestamp, in UTC
        let sunriseUTCDate = SunTimes.utcDateFormatter.date(from: sunriseUTCString)
        let sunsetUTCDate = SunTimes.utcDateFormatter.date(from: sunsetUTCString)
        
        
        //convert UTC timestamp to local time for device
         sunrise = SunTimes.localDateFormatter.string(from: sunriseUTCDate!)
         sunset = SunTimes.localDateFormatter.string(from: sunsetUTCDate!)
        location = ""
        

    }
    
    //Getting the sunset time
    func getSunset()->String{
        return sunset
    }
    
    //Getting the sunrise time
    func getSunrise()->String{
        return sunrise
    }
    
    //Getting the location for the sunrise and sunset times
    func getCity() -> String {
    return location
    }
    

}
