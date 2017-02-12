//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        var planetPoints: Int = 0
        var planetName: String = ""
        
        enum Points: Int {
            case Common = 1
            case Uncommon = 2
            case Rare = 3
            case Legendary = 4
        }
        
        let planetJsonURL = Bundle.main.url(forResource: dataFile, withExtension: "json")!

         let rawPlanetsJSON = NSData(contentsOf: planetJsonURL)
        
        var planetDict: NSArray!
        
        do {
            planetDict = try! JSONSerialization.jsonObject(with: rawPlanetsJSON! as Data, options: JSONSerialization.ReadingOptions()) as! NSArray
        }
        
        for planetItem in planetDict {
            
            var points: Int = 0
            
            if let planet = planetItem as? NSDictionary {
                
                points += planet["CommonItemsDetected"] as! Int * Points.Common.rawValue
                points += planet["UncommonItemsDetected"] as! Int * Points.Uncommon.rawValue
                points += planet["RareItemsDetected"] as! Int * Points.Rare.rawValue
                points += planet["LegendaryItemsDetected"] as! Int * Points.Legendary.rawValue
                
                if points > planetPoints {
                    planetPoints = points
                    planetName = planet["Name"] as! String
                }
            }
            
        }
        
        
        return planetName
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"
