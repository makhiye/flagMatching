//
//  DeckOfCards.swift
//  flag Matching
//
//  Created by ishmael on 7/19/17.
//  Copyright © 2017 ishmael.mthombeni. All rights reserved.
//

import Foundation

struct  DeckOfCards {
    
    var countryFlagNames = ["Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cape Verde","Cameroon","Central African Republic","Chad","Comoros","Republic of the Congo","Congo","Cote d Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea Bissau","Kenya","Lesotho","Liberia","Libya","Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia","Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa","South Sudan","Sudan","Swaziland","Tanzania","Togo","Tunisia","Uganda","Zambia","Zimbabwe"]
    
    var dealtCards: [String] = []
    
    let numberOfMatches = 6
    
    init() {
        
        drawCards()
        
    }
    
    
    
    mutating func drawCards() {
        
        dealtCards.removeAll()
        
        countryFlagNames.shuffle()
        
        for i in 0..<numberOfMatches {
            
            dealtCards.append(countryFlagNames[i])
            dealtCards.append(countryFlagNames[i])
            
        }
        
         dealtCards.shuffle()
    }
}




