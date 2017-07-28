//
//  roundedButtons.swift
//  evenodd app
//
//  Created by Admin on 3/1/17.
//  Copyright © 2017 Ishmael Mthombeni. All rights reserved.
//

import UIKit

class roundedButtons: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
        
        clipsToBounds = true
        
    }

}
