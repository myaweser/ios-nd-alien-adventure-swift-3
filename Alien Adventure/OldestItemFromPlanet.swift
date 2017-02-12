//
//  OldestItemFromPlanet.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func oldestItemFromPlanet(inventory: [UDItem], planet: String) -> UDItem? {

        var oldestItem: UDItem? = inventory.first

        for item in inventory{
            if let planetOfOrigin = item.historicalData["PlanetOfOrigin"], planetOfOrigin as! String == planet {
                //  item.append(item)
                if let carbonAge = item.historicalData["CarbonAge"] as! Int? {
                    if carbonAge > (oldestItem?.historicalData["CarbonAge"] as! Int?)! {
                        oldestItem = item
                    }
                }
            }

    }
    
        return oldestItem

    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 2"
