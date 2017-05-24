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
    case Paver = "paver"
    case SkidSteer = "skid-steer"
    case Steamroller = "steamroller"
}

// MARK: - Create Construction Trucks

/* All images are public domain found at pixabay or wikimedia */
// Gif images are from creative commons licensed videos on YouTube

struct ConstructionTrucks {
    
    // MARK: - Init Contstruction Trucks
    
    static let BackhoeLoader: Truck = Truck(name: ConstructionTruckTypes.BackhoeLoader.rawValue,
        displayName: "Backhoe Loader",
        videoCredit: "BACKHOE LOADER: BACKHOE LOADER by Eric D https://www.youtube.com/watch?v=UiVH4ZmzkL")
    static let Bulldozer: Truck = Truck(name: ConstructionTruckTypes.Bulldozer.rawValue,
        displayName: "Bulldozer",
        videoCredit: "BULLDOZER: BIG Caterpillar bulldozer machines at work on a beach MUST SEE by Nosey Ned https://www.youtube.com/watch?v=USJ2N0olED8")
    static let CementMixer: Truck = Truck(name: ConstructionTruckTypes.CementMixer.rawValue,
        displayName: "Cement Mixer",
        videoCredit: "CEMENT MIXER: 1979 Mack RS6001 mixer truck for sale | sold at auction February 28,2012 by Purple Wave https://www.youtube.com/watch?v=aFlZM_lJuTk")
    static let CraneTruck: Truck = Truck(name: ConstructionTruckTypes.CraneTruck.rawValue,
        displayName: "Crane Truck",
        videoCredit: "CRANE TRUCK: 1990 Ford F800 Fladbed Crane Truck for sale | sold at auction July 12, 2012 by Purple Wave https://www.youtube.com/watch?v=TQGaNgTTliQ")
    static let DumpTruck: Truck = Truck(name: ConstructionTruckTypes.DumpTruck.rawValue,
        displayName: "Dump Truck",
        videoCredit: "DUMP TRUCK: The Largest Dump Truck Liebherr T282B by Vehicle Channel https://www.youtube.com/watch?v=EnXVM_qlr44")
    static let Excavator: Truck = Truck(name: ConstructionTruckTypes.Excavator.rawValue,
        displayName: "Excavator",
        videoCredit: "EXCAVATOR: Digger NZ by Justus Haufe https://www.youtube.com/watch?v=J07zXL5EiTc&t=10s")
    static let Forklift: Truck = Truck(name: ConstructionTruckTypes.Forklift.rawValue,
        displayName: "Forklift",
        videoCredit: "FORKLIFT: Small Electric Forklift by Erica Liu  https://www.youtube.com/watch?v=W7pOxH9d0B4")
    static let FrontEndLoader: Truck = Truck(name: ConstructionTruckTypes.FrontEndLoader.rawValue,
        displayName: "Front End Loader",
        videoCredit: "FRONT END LOADER: CAT Truck Loader At Work by Julie Barnett https://www.youtube.com/watch?v=i7umujl44YA")
    static let Grader: Truck = Truck(name: ConstructionTruckTypes.Grader.rawValue,
        displayName: "Grader",
        videoCredit: "GRADER: CAT Grader Makes the Road by Julie Barnett https://www.youtube.com/watch?v=cUl3kHqsdxA*/")
    static let Paver: Truck = Truck(name: ConstructionTruckTypes.Paver.rawValue,
        displayName: "Paver", videoCredit: "PAVER: Paving Main Street.wmv by Sara Piazza https://www.youtube.com/watch?v=y6wcUZfUCJE")
    static let SkidSteer: Truck = Truck(name: ConstructionTruckTypes.SkidSteer.rawValue,
        displayName: "Skid Steer",
        videoCredit: "SKID-STEER: Skid-Steer Loader by Ytrhampton https://www.youtube.com/watch?v=oH0nCS5H94M")
    static let Steamroller: Truck = Truck(name: ConstructionTruckTypes.Steamroller.rawValue,
        displayName: "Steamroller",
        videoCredit: "STEAMROLLER: Hyster C350C double drum roller | no-reserve Internet auction August 25, 2011 by Purple Wave https://www.youtube.com/watch?v=pmXITU8IJbk")
    
    // MARK: - All Construction Trucks
    
    static let allConstructionTrucks: [Truck] = [
        BackhoeLoader,
        Bulldozer,
        CementMixer,
        CraneTruck,
        DumpTruck,
        Excavator,
        Forklift,
        FrontEndLoader,
        Grader,
        Paver,
        SkidSteer,
        Steamroller
    ]
    
}

