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

/* All images are public domain found at pixabay or wikimedia */
// Gif images are from creative commons licensed videos on YouTube

struct EmergencyTrucks {
    
    // MARK: - Init Emergency Trucks
    
    static let AirportFireTruck: Truck = Truck(name: EmergencyTruckTypes.AirportFireTruck.rawValue,
                                               displayName: "Airport Fire Truck",
                                               videoCredit: "AIRPORT FIRE TRUCK: Airport fire rescue OSLO Gardemoen flypassbrannvesen by EmeggencyService911 https://www.youtube.com/watch?v=fWGAos6R5tU")
    static let Ambulance: Truck = Truck(name: EmergencyTruckTypes.Ambulance.rawValue,
                                        displayName: "Ambulance",
                                        videoCredit: "AMBULANCE: Emergency Ambulance Responding in Dublin | Great Siren! by Dave's Videos https://www.youtube.com/watch?v=A9WspEav8eU")
    static let FireBoat: Truck = Truck(name: EmergencyTruckTypes.FireBoat.rawValue,
                                       displayName: "Fire Boat",
                                       videoCredit: "FIRE BOAT: 45 Foot Response Boat by Public Resource Org  https://www.youtube.com/watch?v=t2dFOhaj4Xw")
    static let FireChiefsTruck: Truck = Truck(name: EmergencyTruckTypes.FireCheifsTruck.rawValue,
                                              displayName: "Fire Chief's Truck",
                                              videoCredit: "FIRE CHIEF'S TRUCK: Wheaton ALS742 Responding 10-3-16 by Fire Productions https://www.youtube.com/watch?v=O9cAfim99bk")
    static let LadderTruck: Truck = Truck(name: EmergencyTruckTypes.LadderTruck.rawValue,
                                          displayName: "Ladder Truck",
                                          videoCredit: "LADDER TRUCK: SFD Ladder 8 Responding from Station 18 by Sam Altenberger https://www.youtube.com/watch?v=amlH7nDxi6U")
    static let MilitaryHelicopter: Truck = Truck(name: EmergencyTruckTypes.MilitaryHelicopter.rawValue,
                                                 displayName: "Military Helicopter",
                                                 videoCredit: "MILITARY HELICOPTER: CH-53E Super Stallion - Biggest Helicopter in US Military - New 2017 by Renan Rissardo https://www.youtube.com/watch?v=PkUIjL0lMbE")
    static let PoliceBoat: Truck = Truck(name: EmergencyTruckTypes.PoliceBoat.rawValue,
                                         displayName: "Police Boat",
                                         videoCredit: "POLICE BOAT: boats, boats, boats by Queensland Police https://www.youtube.com/watch?v=EakuJxAbM0k")
    static let PoliceCar: Truck = Truck(name: EmergencyTruckTypes.PoliceCar.rawValue,
                                        displayName: "Police Car",
                                        videoCredit: "POLICE CAR: Dacia Logan Politie (Police) with sirens and lights by ConnectorXP https://www.youtube.com/watch?v=JfzM_99kuTU")
    static let PumperTruck: Truck = Truck(name: EmergencyTruckTypes.PumperTruck.rawValue,
                                          displayName: "Pumper Truck",
                                          videoCredit: "PUMPER TRUCK: Engine 25 responding by New Rochelle Firefighters https://www.youtube.com/watch?v=4e54rI66c9M")
    static let RescueHelicopter: Truck = Truck(name: EmergencyTruckTypes.RescueHelicopter.rawValue,
                                               displayName: "Rescue Helicopter",
                                               videoCredit: "RESCUE HELICOPTER: Rescue! Portland Coast Guard helicopter, West Cliff by Stuart Morris https://www.youtube.com/watch?v=awhL2WXdqMk")
    static let Snowplow: Truck = Truck(name: EmergencyTruckTypes.Snowplow.rawValue,
                                       displayName: "Snowplow",
                                       videoCredit: "SNOWPLOW: Ottawa Snow Plow Sidewalk Clearing by Robert Schwartz https://www.youtube.com/watch?v=ov54w-U5zE8")
    static let TowTruck: Truck = Truck(name: EmergencyTruckTypes.TowTruck.rawValue,
                                       displayName: "Tow Truck",
                                       videoCredit: "TOW TRUCK: Hyster C350C double drum roller | no-reserve Internet auction August 25, 2011 by Purple Wave https://www.youtube.com/watch?v=pmXITU8IJbk")
    
    // MARK: - Photo Credit
    
    static let fireChiefsTruckPhotoCredit: String = "Fire Chief’s Truck Photo By Lee Cannon from Bayville aka West Fenwick, DE, USA [CC BY-SA 2.0 (http://creativecommons.org/licenses/by-sa/2.0)], via Wikimedia Commons https://upload.wikimedia.org/wikipedia/commons/5/5d/Frankford_Volunteer_Fire_Company%2C_Station_76%2C_DE_%284814086370%29.jpg"
    
    // MARK: - All Emergency Trucks
    
    static let allEmergencyTrucks: [Truck] = [
        AirportFireTruck,
        Ambulance,
        FireBoat,
        FireChiefsTruck,
        LadderTruck,
        MilitaryHelicopter,
        PoliceBoat,
        PoliceCar,
        PumperTruck,
        RescueHelicopter,
        Snowplow,
        TowTruck
    ]
    
    static let emergencyTrucksWithSirens: [String] = [
        EmergencyTruckTypes.AirportFireTruck.rawValue,
        EmergencyTruckTypes.Ambulance.rawValue,
        EmergencyTruckTypes.FireBoat.rawValue,
        EmergencyTruckTypes.FireCheifsTruck.rawValue,
        EmergencyTruckTypes.LadderTruck.rawValue,
        EmergencyTruckTypes.PoliceBoat.rawValue,
        EmergencyTruckTypes.PoliceCar.rawValue,
        EmergencyTruckTypes.PumperTruck.rawValue
    ]
}

