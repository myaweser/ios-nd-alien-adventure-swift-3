//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        var items: [Int] = []
        
        if let datafileURL = Bundle.main.url(forResource: dataFile, withExtension: "plist") {
            
            let data = NSArray(contentsOf: datafileURL)
            
            for item in data! {
                
                var name: String?
                var carbonAge: Int?
                
                if let item = item as? NSDictionary {
                    if let itemName = item["Name"] as? String {
                        name = itemName                    }
                    
                    if let historicalData = item["HistoricalData"] as? [String: AnyObject] {
                        if let itemCarbonAge = historicalData["CarbonAge"] as? Int {
                            carbonAge = itemCarbonAge
                        }
                    }
                    
                    if name!.lowercased().contains("laser") && carbonAge! < 30 {
                        print("\(name) with age \(carbonAge) is banned")
                        items.append(item["ItemID"] as! Int)
                    } else {
                        print("\(name) with age \(carbonAge) kept")
                    }
                    
                }
                
            }
            print(items)
            
        }
        return items
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"
