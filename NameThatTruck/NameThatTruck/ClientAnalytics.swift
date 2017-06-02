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
        Analytics.logEvent("started_construction_truck_game", parameters: [AnalyticsParameterItemID: gameType as NSObject])
    }
    
    static func startedEmergencyTruckGame(gameType: String) {
        // choose Emergency Trucks Game
        Analytics.logEvent("started_emergency_truck_game", parameters: [AnalyticsParameterItemID: gameType as NSObject])
    }
    
    static func startedCityTruckGame(gameType: String) {
        // choose City Trucks Game
        Analytics.logEvent("started_city_truck_game", parameters: [AnalyticsParameterItemID: gameType as NSObject])
    }
    
    static func startedAllTruckGame(gameType: String) {
        // choose All Trucks Game
        Analytics.logEvent("started_all_truck_game", parameters: [AnalyticsParameterItemID: gameType as NSObject])
    }
    
    // MARK: Log when user chooses to view Flickr photos
    
    static func viewedTruckPhotos(truckType: String) {
        Analytics.logEvent("viewed_truck_photos", parameters: [AnalyticsParameterItemID: truckType as NSObject])
    }
    
    // MARK: Log when user turns off Flickr photo feature
    
    static func disabledTruckPhotos(photoFeatureMuted: Bool) {
        Analytics.logEvent("disabled_truck_photos", parameters: [AnalyticsParameterItemID: photoFeatureMuted as NSObject])
    }
}
