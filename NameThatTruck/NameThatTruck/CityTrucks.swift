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
    
    // MARK: - Init City Trucks
    
    static let BigRig = Truck(name: CityTruckTypes.BigRig.rawValue,
                              displayName: "Big Rig",
                              videoCredit: "BIG RIG: Big Rig Racing by Lucu Motor TV https://www.youtube.com/watch?v=y8fTI4I2leI")
    static let BucketTruck = Truck(name: CityTruckTypes.BucketTruck.rawValue,
                                   displayName: "Bucket Truck",
                                   videoCredit: "BUCKET TRUCK: 2002 Chevrolet C7500 bucket truck for sale | no-reserve internet auction May 25, 2017 by Purple Wave https://www.youtube.com/watch?v=98fuED9cnhc")
    static let CarTransporter = Truck(name: CityTruckTypes.CarTransporter.rawValue,
                                      displayName: "Car Transporter",
                                      videoCredit: "CAR TRANSPORTER: Police VW Passat B7 Car Transporter Rare by Ynterstella https://www.youtube.com/watch?v=oLOvllNsySo")
    static let DeliveryTruck = Truck(name: CityTruckTypes.DeliveryTruck.rawValue,
                                     displayName: "Delivery Truck",
                                     videoCredit: "DELIVERY TRUCK: an entire fleet of USPS trucks cruise westbound at by Youngho Kim https://www.youtube.com/watch?v=Juo--wVAn4I")
    static let FuelTruck = Truck(name: CityTruckTypes.FuelTruck.rawValue,
                                 displayName: "Fuel Truck",
                                 videoCredit: "FUEL TRUCK: Railroad Boosts Fuel Economy with Cent Premium Diesel 07 by chsincorporated https://www.youtube.com/watch?v=X6nWAclQqN4")
    static let GarbageTruck = Truck(name: CityTruckTypes.GarbageTruck.rawValue,
                                    displayName: "Garbage Truck",
                                    videoCredit: "GARBAGE TRUCK: Automatic Trash Truck Collecting Garbage by WalkaboutAK https://www.youtube.com/watch?v=BNxjtQtZ4Cc")
    static let IceCreamTruck = Truck(name: CityTruckTypes.IceCreamTruck.rawValue,
                                     displayName: "Ice Cream Truck",
                                     videoCredit: "ICE CREAM TRUCK: Ice Cream Truck by Andrew Whites https://www.youtube.com/watch?v=rWu1s4Cinxc")
    static let MailTruck = Truck(name: CityTruckTypes.MailTruck.rawValue,
                                 displayName: "Mail Truck",
                                 videoCredit: "MAIL TRUCK: delivering mail before Christmas by The US Army https://www.youtube.com/watch?v=HYnYAbPgDX0")
    static let PickupTruck = Truck(name: CityTruckTypes.PickupTruck.rawValue,
                                   displayName: "Pickup Truck",
                                   videoCredit: "PICKUP TRUCK: 2011 Ford F250 XLT super cab pickup truck for sale | no-reserve internet auction April 26, 2017 by Purple Wave https://www.youtube.com/watch?v=rrfXMobIcNc")
    static let SchoolBus = Truck(name: CityTruckTypes.SchoolBus.rawValue,
                                 displayName: "School Bus",
                                 videoCredit: "SCHOOL BUS: 1992 Thomas Built Saf-T-Liner MVP School Bus for sale | Sold at auction September 9, 2014 by Purple Wave https://www.youtube.com/watch?v=QYXrdjfslCU")
    static let StreetSweeper = Truck(name: CityTruckTypes.StreetSweeper.rawValue,
                                     displayName: "Street Sweeper",
                                     videoCredit: "STREET SWEEPER: 2002 Johnson 3000 Street Sweeper for sale | sold at auction September 15, 2011 by Purple Wave https://www.youtube.com/watch?v=Gcl_c6jeZBE")
    static let Tractor = Truck(name: CityTruckTypes.Tractor.rawValue,
                               displayName: "Tractor",
                               videoCredit: "Formal M with a 4-bottom plow pulling hard by Dennis DeBruler https://www.youtube.com/watch?v=g95e2kefKQU")
    
    // MARK: - All City Trucks
    
    static let allCityTrucks: [Truck] = [
        BigRig,
        BucketTruck,
        CarTransporter,
        DeliveryTruck,
        FuelTruck,
        GarbageTruck,
        IceCreamTruck,
        MailTruck,
        PickupTruck,
        SchoolBus,
        StreetSweeper,
        Tractor
    ]
}


