//
//  SunDelegate.swift
//  Sunrise
//
//  Created by Guled Ali on 4/10/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation

protocol SunDelegate{
    func timesRead(suntimes:SunTimes) -> Void //Passes the suntimes to the UI
    func locations(locations: String) -> Void // Passes the location to the UI
}
