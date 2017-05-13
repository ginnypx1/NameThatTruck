//
//  CityTrucks.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/13/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

// MARK: - City Trucks

/*
enum CityTruckTypes: String {
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

// MARK: - Create trucks

/* All images are public domain found at pixabay or wikimedia
 With the exception of the fire chief's truck: Fire Chief’s Truck Photo By Lee Cannon from Bayville aka West Fenwick, DE, USA [CC BY-SA 2.0 (http://creativecommons.org/licenses/by-sa/2.0)], via Wikimedia Commons
 https://upload.wikimedia.org/wikipedia/commons/5/5d/Frankford_Volunteer_Fire_Company%2C_Station_76%2C_DE_%284814086370%29.jpg
 */

// Gif images are from creative commons licensed videos on YouTube

/* Airport fire rescue OSLO Gardemoen flypassbrannvesen by EmeggencyService911 https://www.youtube.com/watch?v=fWGAos6R5tU */
let airportFireTruck = Truck(name: EmergencyTruckTypes.AirportFireTruck.rawValue, displayName: "Airport Fire Truck")

/* Emergency Ambulance Responding in Dublin | Great Siren! by Dave's Videos https://www.youtube.com/watch?v=A9WspEav8eU */
let ambulance = Truck(name: EmergencyTruckTypes.Ambulance.rawValue, displayName: "Ambulance")

/* 45 Foot Response Boat by Public Resource Org  https://www.youtube.com/watch?v=t2dFOhaj4Xw */
let fireBoat = Truck(name: EmergencyTruckTypes.FireBoat.rawValue, displayName: "Fire Boat")

/* Wheaton ALS742 Responding 10-3-16 by Fire Productions https://www.youtube.com/watch?v=O9cAfim99bk */
let fireChiefsTruck = Truck(name: EmergencyTruckTypes.FireCheifsTruck.rawValue, displayName: "Fire Chief's Truck")

/* SFD Ladder 8 Responding from Station 18 by Sam Altenberger https://www.youtube.com/watch?v=amlH7nDxi6U */
let ladderTruck = Truck(name: EmergencyTruckTypes.LadderTruck.rawValue, displayName: "Ladder Truck")

/* CH-53E Super Stallion - Biggest Helicopter in US Military - New 2017 by Renan Rissardo https://www.youtube.com/watch?v=PkUIjL0lMbE */
let militaryHelicopter = Truck(name: EmergencyTruckTypes.MilitaryHelicopter.rawValue, displayName: "Military Helicopter")

/* boats, boats, boats by Queensland Police https://www.youtube.com/watch?v=EakuJxAbM0k */
let policeBoat = Truck(name: EmergencyTruckTypes.PoliceBoat.rawValue, displayName: "Police Boat")

/* Dacia Logan Politie (Police) with sirens and lights by ConnectorXP https://www.youtube.com/watch?v=JfzM_99kuTU */
let policeCar = Truck(name: EmergencyTruckTypes.PoliceCar.rawValue, displayName: "Police Car")

/* Engine 25 responding by New Rochelle Firefighters https://www.youtube.com/watch?v=4e54rI66c9M */
let pumperTruck = Truck(name: EmergencyTruckTypes.PumperTruck.rawValue, displayName: "Pumper Truck")

/* Rescue! Portland Coast Guard helicopter, West Cliff by Stuart Morris https://www.youtube.com/watch?v=awhL2WXdqMk */
let rescueHelicopter = Truck(name: EmergencyTruckTypes.RescueHelicopter.rawValue, displayName: "Rescue Helicopter")

/* Ottawa Snow Plow Sidewalk Clearing by Robert Schwartz https://www.youtube.com/watch?v=ov54w-U5zE8 */
let snowplow = Truck(name: EmergencyTruckTypes.Snowplow.rawValue, displayName: "Snowplow")

/* Hyster C350C double drum roller | no-reserve Internet auction August 25, 2011 by Purple Wave
 https://www.youtube.com/watch?v=pmXITU8IJbk */
let towTruck = Truck(name: EmergencyTruckTypes.TowTruck.rawValue, displayName: "Tow Truck")

// MARK: - Create set of Emergency Trucks
 */

let allCityTrucks: [Truck] = [airportFireTruck, ambulance, fireBoat, fireChiefsTruck, ladderTruck, militaryHelicopter, policeBoat, policeCar, pumperTruck, rescueHelicopter, snowplow, towTruck]
