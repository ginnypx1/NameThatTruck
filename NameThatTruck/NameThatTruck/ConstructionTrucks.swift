//
//  ConstructionTrucks.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Construction Trucks

enum ConstructionTruckTypes: String {
    case BackhoeLoader = "backhoe-loader"
    case Bulldozer = "bulldozer"
    case CementMixer = "cement-mixer"
    case CraneTruck = "crane-truck"
    case DumpTruck = "dump-truck"
    case Excavator = "excavator"
    case Forklift = "forklift"
    case FrontEndLoader = "front-end-loader"
    case Grader = "grader"
    case SkidSteer = "skid-steer"
    case Steamroller = "steamroller"
}

// MARK: - Create trucks

let backhoeLoader = Truck(name: ConstructionTruckTypes.BackhoeLoader.rawValue, displayName: "Backhoe Loader")
let bulldozer = Truck(name: ConstructionTruckTypes.Bulldozer.rawValue, displayName: "Bulldozer")
let cementMixer = Truck(name: ConstructionTruckTypes.CementMixer.rawValue, displayName: "Cement Mixer")
let craneTruck = Truck(name: ConstructionTruckTypes.CraneTruck.rawValue, displayName: "Crane Truck")
let dumpTruck = Truck(name: ConstructionTruckTypes.DumpTruck.rawValue, displayName: "Dump Truck")
let excavator = Truck(name: ConstructionTruckTypes.Excavator.rawValue, displayName: "Excavator")
let forklift = Truck(name: ConstructionTruckTypes.Forklift.rawValue, displayName: "Forklift")
let frontEndLoader = Truck(name: ConstructionTruckTypes.FrontEndLoader.rawValue, displayName: "Front End Loader")
let grader = Truck(name: ConstructionTruckTypes.Grader.rawValue, displayName: "Grader")
let skidSteer = Truck(name: ConstructionTruckTypes.SkidSteer.rawValue, displayName: "Skid Steer")
let steamroller = Truck(name: ConstructionTruckTypes.Steamroller.rawValue, displayName: "Steamroller")

// MARK: - Create set of Construction Trucks
    
let allConstructionTrucks: [Truck] = [backhoeLoader, bulldozer, cementMixer, craneTruck, dumpTruck, excavator, forklift, frontEndLoader, grader, skidSteer, steamroller]
