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

enum CityTruckTypes: String {
    case BigRig = "big-rig"
    case BucketTruck = "bucket-truck"
    case CarTransporter = "car-transporter"
    case DeliveryTruck = "delivery-truck"
    case FuelTruck = "fuel-truck"
    case GarbageTruck = "garbage-truck"
    case IceCreamTruck = "ice-cream-truck"
    case MailTruck = "mail-truck"
    case PickupTruck = "pickup-truck"
    case SchoolBus = "school-bus"
    case StreetSweeper = "street-sweeper"
    case Tractor = "tractor"
}

// MARK: - Create City Trucks

/* All images are public domain found at pixabay or wikimedia */
// Gif images are from creative commons licensed videos on YouTube

struct CityTrucks {
    
    static let allCityTrucks: [Truck] = [
        /* Big Rig Racing by Lucu Motor TV https://www.youtube.com/watch?v=y8fTI4I2leI */
        Truck(name: CityTruckTypes.BigRig.rawValue, displayName: "Big Rig"),
    
        /* 2002 Chevrolet C7500 bucket truck for sale | no-reserve internet auction May 25, 2017 by Purple Wave https://www.youtube.com/watch?v=98fuED9cnhc */
        Truck(name: CityTruckTypes.BucketTruck.rawValue, displayName: "Bucket Truck"),
    
        /* Police VW Passat B7 Car Transporter Rare by Ynterstella https://www.youtube.com/watch?v=oLOvllNsySo*/
        Truck(name: CityTruckTypes.CarTransporter.rawValue, displayName: "Car Transporter"),
    
        /* an entire fleet of USPS trucks cruise westbound at by Youngho Kim https://www.youtube.com/watch?v=Juo--wVAn4I */
        Truck(name: CityTruckTypes.DeliveryTruck.rawValue, displayName: "Delivery Truck"),
    
        /* Railroad Boosts Fuel Economy with Cent Premium Diesel 07 by chsincorporated https://www.youtube.com/watch?v=X6nWAclQqN4 */
        Truck(name: CityTruckTypes.FuelTruck.rawValue, displayName: "Fuel Truck"),
    
        /* Automatic Trash Truck Collecting Garbage by WalkaboutAK https://www.youtube.com/watch?v=BNxjtQtZ4Cc */
        Truck(name: CityTruckTypes.GarbageTruck.rawValue, displayName: "Garbage Truck"),
    
        /* Ice Cream Truck by Andrew Whites https://www.youtube.com/watch?v=rWu1s4Cinxc */
        Truck(name: CityTruckTypes.IceCreamTruck.rawValue, displayName: "Ice Cream Truck"),
    
        /* delivering mail before Christmas by The US Army https://www.youtube.com/watch?v=HYnYAbPgDX0 */
        Truck(name: CityTruckTypes.MailTruck.rawValue, displayName: "Mail Truck"),
    
        /* 2011 Ford F250 XLT super cab pickup truck for sale | no-reserve internet auction April 26, 2017 by Purple Wave https://www.youtube.com/watch?v=rrfXMobIcNc */
        Truck(name: CityTruckTypes.PickupTruck.rawValue, displayName: "Pickup Truck"),
    
        /* 1992 Thomas Built Saf-T-Liner MVP School Bus for sale | Sold at auction September 9, 2014 by Purple Wave https://www.youtube.com/watch?v=QYXrdjfslCU */
        Truck(name: CityTruckTypes.SchoolBus.rawValue, displayName: "School Bus"),
    
        /* 2002 Johnson 3000 Street Sweeper for sale | sold at auction September 15, 2011 by Purple Wave https://www.youtube.com/watch?v=Gcl_c6jeZBE*/
        Truck(name: CityTruckTypes.StreetSweeper.rawValue, displayName: "Street Sweeper"),
    
        /* H2012 John Deere 6125R MFWD tractor for sale | sold at auction March 26, 2014 by Purple Wave https://www.youtube.com/watch?v=g95e2kefKQU */
        Truck(name: CityTruckTypes.Tractor.rawValue, displayName: "Tractor")
    ]
}


