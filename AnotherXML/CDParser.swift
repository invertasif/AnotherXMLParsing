//
//  CDParser.swift
//  AnotherXML
//
//  Created by Asif Ikbal on 4/23/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import Foundation


class CDParser: XMLParser, XMLParserDelegate {
    
    var cdArray:[CD] = []
    var cdObj:CD?
    var elementString: String = ""
    
    func passData() -> [CD] {
        self.delegate = self
        
        self.parse()
        return cdArray
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "CD" {
            cdObj = CD()
        }
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        elementString += string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "title" {
            cdObj?.title = elementString
        } else if elementName == "artist" {
            cdObj?.artist = elementString
        } else if elementName == "country" {
            cdObj?.country = elementString
        } else if elementName == "company" {
            cdObj?.company = elementString
        } else if elementName == "price" {
            cdObj?.price = Double(elementString)!
        } else if elementName == "year" {
            cdObj?.year = Int(elementString)!
        }
        
        elementString = ""
        if elementName == "CD" {
            cdArray.append(cdObj!)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
    }
    
    
}
