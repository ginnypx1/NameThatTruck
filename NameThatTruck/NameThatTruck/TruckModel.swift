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
    
    // MARK: - Truck Variables
    
    static var lastSelectedTruck: Truck?
    
    // MARK - Truck Sets
    
    static let allTrucks: [Truck] = ConstructionTrucks.allConstructionTrucks + EmergencyTrucks.allEmergencyTrucks + CityTrucks.allCityTrucks
    
    static let notTrucks: [String] = [EmergencyTruckTypes.MilitaryHelicopter.rawValue, EmergencyTruckTypes.RescueHelicopter.rawValue, EmergencyTruckTypes.FireBoat.rawValue, EmergencyTruckTypes.PoliceBoat.rawValue]
    
    // MARK: - Truck Properties
    
    let name: String
    let displayName: String
    let image: UIImage?
    let gifString: String
    let audioString: String
    var searchTag: String
    var videoCredit: String?
    
    // MARK: - Truck Init
    
    // init without video credit
    init(name: String, displayName: String) {
        self.name = name
        self.displayName = displayName
        self.image = UIImage(named: name)
        self.gifString = name
        self.audioString = name
        self.searchTag = name.replacingOccurrences(of: "-", with: "+")
    }
    
    // init if adding videoCredit
    init(name: String, displayName: String, videoCredit: String) {
        self.name = name
        self.displayName = displayName
        self.image = UIImage(named: name)
        self.gifString = name
        self.audioString = name
        self.searchTag = name.replacingOccurrences(of: "-", with: "+")
        self.videoCredit = videoCredit
    }
    
}
