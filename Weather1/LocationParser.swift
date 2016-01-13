//
//  LocationParser.swift
//  Weather1
//
//  Created by Teerapong on 1/12/16.
//  Copyright © 2016 bananacoding. All rights reserved.
//

import UIKit

class LocationParser: NSObject, NSXMLParserDelegate {
    private var parser = NSXMLParser()
    private var element = String()
    var weather = Weather()
   
    
    init(url: String) {
        super.init()
        
        let urlToSend: NSURL = NSURL(string: url)!
        parser = NSXMLParser(contentsOfURL: urlToSend)!
        parser.delegate = self
        
        let success: Bool = parser.parse()
        
        if success {
            print("parse success")
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName
        print("GU Come->>>>>")
        if elementName == "woeid" {
            weather = Weather()
        }

    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if element == "woeid" {
            weather.woeid += string
            print(weather.woeid)
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "woeid" {
            return;
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print("parse failure! error: \(parseError)");
    }
}
