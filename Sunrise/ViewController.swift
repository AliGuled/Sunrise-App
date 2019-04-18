//
//  ViewController.swift
//  Sunrise
//
//  Created by Guled Ali on 4/8/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SunDelegate {
    func locations(locations: String) {
        DispatchQueue.main.async {
          
                self.locationLabel.text = locations
            
        }
    }
    
    var sunTimes: Results!
    var delegate:  SunDelegate?

    @IBOutlet weak var sunriseLabel: UILabel! 
      
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
   // var location: SunTimesService = SunTimesService()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "?????"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
 
    
    func timesRead(suntimes: SunTimes) {
        
        DispatchQueue.main.async {
            self.sunriseLabel!.text = suntimes.sunrise
            self.sunsetLabel!.text = suntimes.sunset

        }
       
        
    }


}

