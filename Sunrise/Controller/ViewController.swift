//
//  ViewController.swift
//  Sunrise
//
//  Created by Guled Ali on 4/8/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SunDelegate {
    
    
/*
    Get the current user location
    In the main thread
    
*/
    func locations(locations: String) {
        DispatchQueue.main.async {
  
            self.title = locations
            print("print statement\(locations)")
            
        }
    }
    
    
    @IBOutlet weak var sunriseLabel: UILabel!  // Sunrise label
    @IBOutlet weak var sunsetLabel: UILabel!   // Sunset label
   
    
   // var location: SunTimesService = SunTimesService()
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.title = "?????"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    /*
     Get the user sunrise times
     Get the user sunset times
    */
    func timesRead(suntimes: SunTimes) {
        
        DispatchQueue.main.async {
            self.sunriseLabel!.text = suntimes.sunrise
            self.sunsetLabel!.text = suntimes.sunset

        }
       
        
    }


}

