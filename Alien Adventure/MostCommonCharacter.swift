//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        print(inventory)
        
        var chars = [Character: Int]()
        
        if inventory.count > 0 {
            for item in inventory {
                
                for char in item.name.characters {
                    
                    if let charNumber = chars[char] {
                        chars[char] = chars[char]! + 1
                    } else {
                        chars[char] = 0
                    }
                    
                }
                
            }
        } else {
            return nil
        }
        
        print(chars)
        
        var charNumber = 0
        var commonChar: Character?
        
        print(chars)
        
        for (key, value) in chars {
            if value > charNumber {
                charNumber = value
                commonChar = key
            }
        }
        print("return \(commonChar)")
        return commonChar    }
}
