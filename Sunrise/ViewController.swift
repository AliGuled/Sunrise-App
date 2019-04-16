//
//  ViewController.swift
//  Sunrise
//
//  Created by Guled Ali on 4/8/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SunDelegate {
   
    
    
    var sunTimes: Results!
    
    var delegate:  SunDelegate?

    @IBOutlet weak var sunriseLabel: UILabel! 
      
    @IBOutlet weak var sunsetLabel: UILabel!
    
   // var location: SunTimesService = SunTimesService()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "?????"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func timesRead(suntimes: SunTimes) {
        
        if delegate != nil {
            if sunriseLabel.text != nil {
                
                sunriseLabel.text = suntimes.sunrise
                
            }
        }
    }


}

