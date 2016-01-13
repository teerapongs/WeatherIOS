//
//  ViewController.swift
//  Weather1
//
//  Created by ton on 1/4/2559 BE.
//  Copyright © 2559 bananacoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    var id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("woeid:---------->\(id)")
        let parser = XMLParser(url: "https://weather.yahooapis.com/forecastrss?w=\(id)&u=c")
        let weather: Weather = parser.weather
        var string = String()
        
        string = "\(weather.title)\n\n"
        string += "Current Conditions: \(weather.descriptionOfConditions), \(weather.temp)C\n\n"
        string += "forecast:\n"
        for forecast in weather.forecasts {
            let day = forecast["day"] as! String
            let descriptionOfConditions = forecast["descriptionOfConditions"] as! String
            let highTemp = forecast["highTemp"] as! String
            let lowTemp = forecast["lowTemp"] as! String
            
            string += "\(day) - \(descriptionOfConditions). High: \(highTemp) Low: \(lowTemp)\n"
        }
        
        textField.text = string
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

