//
//  LocationViewController.swift
//  Weather1
//
//  Created by Teerapong on 1/12/16.
//  Copyright © 2016 bananacoding. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    var titleLatitde = String()
    var titleLongitude = String()
    var id : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func summitLatAndLong(sender: AnyObject) {
        titleLatitde = latitudeTextField.text ?? ""
        titleLongitude = longitudeTextField.text ?? ""
   
        let parser = LocationParser(url: "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.placefinder%20where%20text=%22\(titleLatitde),\(titleLongitude)%22%20and%20gflags=%22R%22")
        
        let weather: Weather = parser.weather
        id = weather.woeid
    

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWeather" {
            let controller = segue.destinationViewController as! ViewController
            print("IDDDDDDDDDD--------->\(id)")
            controller.id = id
        }
        
    }
}
