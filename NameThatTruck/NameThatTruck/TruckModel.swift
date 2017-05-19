//
//  TruckModel.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Truck Model

class Truck {
    
    static var lastSelectedTruck: Truck? 
    
    static let allTrucks: [Truck] = ConstructionTrucks.allConstructionTrucks + EmergencyTrucks.allEmergencyTrucks + CityTrucks.allCityTrucks
    
    let name: String
    let displayName: String
    let image: UIImage?
    let gifString: String
    let searchTag: String
    
    init(name: String, displayName: String) {
        self.name = name
        self.displayName = displayName
        self.image = UIImage(named: name)
        self.gifString = name
        self.searchTag = name.replacingOccurrences(of: "-", with: "+")
    }
    
}
