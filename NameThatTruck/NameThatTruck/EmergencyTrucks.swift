//
//  EmergencyTrucks.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/13/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Emergency Trucks

enum EmergencyTruckTypes: String {
    case AirportFireTruck = "airport-fire-truck"
    case Ambulance = "ambulance"
    case FireBoat = "fire-boat"
    case FireCheifsTruck = "fire-chiefs-truck"
    case LadderTruck = "ladder-truck"
    case MilitaryHelicopter = "military-helicopter"
    case PoliceBoat = "police-boat"
    case PoliceCar = "police-car"
    case PumperTruck = "pumper-truck"
    case RescueHelicopter = "rescue-helicopter"
    case Snowplow = "snowplow"
    case TowTruck = "tow-truck"
}

// MARK: - Create Emergency Trucks

/* All images are public domain found at pixabay or wikimedia
 With the exception of the fire chief's truck: Fire Chief’s Truck Photo By Lee Cannon from Bayville aka West Fenwick, DE, USA [CC BY-SA 2.0 (http://creativecommons.org/licenses/by-sa/2.0)], via Wikimedia Commons
 https://upload.wikimedia.org/wikipedia/commons/5/5d/Frankford_Volunteer_Fire_Company%2C_Station_76%2C_DE_%284814086370%29.jpg
 */

// Gif images are from creative commons licensed videos on YouTube

struct EmergencyTrucks {
    static let allEmergencyTrucks: [Truck] = [
        /* Airport fire rescue OSLO Gardemoen flypassbrannvesen by EmeggencyService911 https://www.youtube.com/watch?v=fWGAos6R5tU */
        Truck(name: EmergencyTruckTypes.AirportFireTruck.rawValue, displayName: "Airport Fire Truck"),
    
        /* Emergency Ambulance Responding in Dublin | Great Siren! by Dave's Videos https://www.youtube.com/watch?v=A9WspEav8eU */
        Truck(name: EmergencyTruckTypes.Ambulance.rawValue, displayName: "Ambulance"),
    
        /* 45 Foot Response Boat by Public Resource Org  https://www.youtube.com/watch?v=t2dFOhaj4Xw */
        Truck(name: EmergencyTruckTypes.FireBoat.rawValue, displayName: "Fire Boat"),
    
        /* Wheaton ALS742 Responding 10-3-16 by Fire Productions https://www.youtube.com/watch?v=O9cAfim99bk */
        Truck(name: EmergencyTruckTypes.FireCheifsTruck.rawValue, displayName: "Fire Chief's Truck"),
    
        /* SFD Ladder 8 Responding from Station 18 by Sam Altenberger https://www.youtube.com/watch?v=amlH7nDxi6U */
        Truck(name: EmergencyTruckTypes.LadderTruck.rawValue, displayName: "Ladder Truck"),
    
        /* CH-53E Super Stallion - Biggest Helicopter in US Military - New 2017 by Renan Rissardo https://www.youtube.com/watch?v=PkUIjL0lMbE */
        Truck(name: EmergencyTruckTypes.MilitaryHelicopter.rawValue, displayName: "Military Helicopter"),
    
        /* boats, boats, boats by Queensland Police https://www.youtube.com/watch?v=EakuJxAbM0k */
        Truck(name: EmergencyTruckTypes.PoliceBoat.rawValue, displayName: "Police Boat"),
    
        /* Dacia Logan Politie (Police) with sirens and lights by ConnectorXP https://www.youtube.com/watch?v=JfzM_99kuTU */
        Truck(name: EmergencyTruckTypes.PoliceCar.rawValue, displayName: "Police Car"),
    
        /* Engine 25 responding by New Rochelle Firefighters https://www.youtube.com/watch?v=4e54rI66c9M */
        Truck(name: EmergencyTruckTypes.PumperTruck.rawValue, displayName: "Pumper Truck"),
    
        /* Rescue! Portland Coast Guard helicopter, West Cliff by Stuart Morris https://www.youtube.com/watch?v=awhL2WXdqMk */
        Truck(name: EmergencyTruckTypes.RescueHelicopter.rawValue, displayName: "Rescue Helicopter"),
    
        /* Ottawa Snow Plow Sidewalk Clearing by Robert Schwartz https://www.youtube.com/watch?v=ov54w-U5zE8 */
        Truck(name: EmergencyTruckTypes.Snowplow.rawValue, displayName: "Snowplow"),
    
        /* Hyster C350C double drum roller | no-reserve Internet auction August 25, 2011 by Purple Wave https://www.youtube.com/watch?v=pmXITU8IJbk */
        Truck(name: EmergencyTruckTypes.TowTruck.rawValue, displayName: "Tow Truck")
    ]
}

