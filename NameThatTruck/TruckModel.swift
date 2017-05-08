//
//  TruckModel.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Truck Model

class Truck {
    
    let name: String
    let displayName: String
    let image: UIImage?
    let gifString: String
    
    init(name: String, displayName: String) {
        self.name = name
        self.displayName = displayName
        self.image = UIImage(named: name)
        self.gifString = "\(name)-gif.gif"
    }
    
}


