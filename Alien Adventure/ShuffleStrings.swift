//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1: String, s2: String, shuffle: String) -> Bool {
        if (self.filterLettersFromString(letters: s1, shuffledString: shuffle).range(of: s1) != nil) &&
            (self.filterLettersFromString(letters: s2, shuffledString: shuffle).range(of: s2) != nil) {
            return true
        } else {
            
            if s1 == "" && s2 == "" && shuffle == "" {
                return true
            } else {
                return false
            }
            
        }
        
    }
    
    // Helper function
    // Receives a parameter containing the letters to keep in the shuffledString.
    // It removes all other chars that are not included in the shuffledString.
    func filterLettersFromString(letters: String, shuffledString: String) -> String {
        
        var filteredString: String = ""
        
        for char in shuffledString.characters {
            if letters.contains(String(char)) {
                filteredString += String(char)
            }
        }
        
        return filteredString
    }
}

