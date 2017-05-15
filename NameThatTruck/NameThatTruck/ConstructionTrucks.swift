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

// MARK: - Create trucks



struct ConstructionTrucks {
    
    static let allConstructionTrucks: [Truck] = [
        /* BACKHOE LOADER by Eric D https://www.youtube.com/watch?v=UiVH4ZmzkL */
        Truck(name: ConstructionTruckTypes.BackhoeLoader.rawValue, displayName: "Backhoe Loader"),
    
        /* BIG Caterpillar bulldozer machines at work on a beach MUST SEE by Nosey Ned https://www.youtube.com/watch?v=USJ2N0olED8*/
        Truck(name: ConstructionTruckTypes.Bulldozer.rawValue, displayName: "Bulldozer"),
    
        /* 1979 Mack RS6001 mixer truck for sale | sold at auction February 28,2012 by Purple Wave https://www.youtube.com/watch?v=aFlZM_lJuTk */
        Truck(name: ConstructionTruckTypes.CementMixer.rawValue, displayName: "Cement Mixer"),
    
        /* 1990 Ford F800 Fladbed Crane Truck for sale | sold at auction July 12, 2012 by Purple Wave https://www.youtube.com/watch?v=TQGaNgTTliQ */
        Truck(name: ConstructionTruckTypes.CraneTruck.rawValue, displayName: "Crane Truck"),
    
        /* The Largest Dump Truck Liebherr T282B by Vehicle Channel https://www.youtube.com/watch?v=EnXVM_qlr44 */
        Truck(name: ConstructionTruckTypes.DumpTruck.rawValue, displayName: "Dump Truck"),
    
        /* Digger NZ by Justus Haufe https://www.youtube.com/watch?v=J07zXL5EiTc&t=10s */
        Truck(name: ConstructionTruckTypes.Excavator.rawValue, displayName: "Excavator"),
    
        /* Small Electric Forklift by Erica Liu  https://www.youtube.com/watch?v=W7pOxH9d0B4 */
        Truck(name: ConstructionTruckTypes.Forklift.rawValue, displayName: "Forklift"),
    
        /* CAT Truck Loader At Work by Julie Barnett https://www.youtube.com/watch?v=i7umujl44YA*/
        Truck(name: ConstructionTruckTypes.FrontEndLoader.rawValue, displayName: "Front End Loader"),
    
        /* CAT Grader Makes the Road by Julie Barnett https://www.youtube.com/watch?v=cUl3kHqsdxA*/
        Truck(name: ConstructionTruckTypes.Grader.rawValue, displayName: "Grader"),
    
        /* Paving Main Street.wmv by Sara Piazza https://www.youtube.com/watch?v=y6wcUZfUCJE */
        Truck(name: ConstructionTruckTypes.Paver.rawValue, displayName: "Paver"),
    
        /* Skid-Steer Loader by Ytrhampton https://www.youtube.com/watch?v=oH0nCS5H94M */
        Truck(name: ConstructionTruckTypes.SkidSteer.rawValue, displayName: "Skid Steer"),
    
        /* Hyster C350C double drum roller | no-reserve Internet auction August 25, 2011 by Purple Wave https://www.youtube.com/watch?v=pmXITU8IJbk */
        Truck(name: ConstructionTruckTypes.Steamroller.rawValue, displayName: "Steamroller")
    ]
}
