//
//  arrayShuffle.swift
//  flag Matching
//
//  Created by ishmael on 7/19/17.
//  Copyright © 2017 ishmael.mthombeni. All rights reserved.
//

import Foundation

extension Array{
//Randomises the order of the array elements
    
    mutating func shuffle(){
        for _ in 1...self.count{
            self.sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
