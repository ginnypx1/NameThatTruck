//
//  ClientAnalytics.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 6/1/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import Firebase

class ClientAnalytics {
    
    // MARK: Log when user choose each type of game
    
    static func startedContstructionTruckGame(gameType: String) {
        // choose Construction Trucks Game
        FIRAnalytics.logEvent(withName: "started_construction_truck_game", parameters: [kFIRParameterItemID: gameType as NSObject])
    }
    
    static func startedEmergencyTruckGame(gameType: String) {
        // choose Emergency Trucks Game
        FIRAnalytics.logEvent(withName: "started_emergency_truck_game", parameters: [kFIRParameterItemID: gameType as NSObject])
    }
    
    static func startedCityTruckGame(gameType: String) {
        // choose City Trucks Game
        FIRAnalytics.logEvent(withName: "started_city_truck_game", parameters: [kFIRParameterItemID: gameType as NSObject])
    }
    
    static func startedAllTruckGame(gameType: String) {
        // choose All Trucks Game
        FIRAnalytics.logEvent(withName: "started_all_truck_game", parameters: [kFIRParameterItemID: gameType as NSObject])
    }
    
    // MARK: Log when user chooses to view Flickr photos
    
    static func viewedTruckPhotos(truckType: String) {
        FIRAnalytics.logEvent(withName: "viewed_truck_photos", parameters: [kFIRParameterItemID: truckType as NSObject])
    }
    
    // MARK: Log when user turns off Flickr photo feature
    
    static func disabledTruckPhotos(photoFeatureMuted: Bool) {
        FIRAnalytics.logEvent(withName: "disabled_truck_photos", parameters: [kFIRParameterItemID: photoFeatureMuted as NSObject])
    }
}
