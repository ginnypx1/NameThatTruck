//
//  CreditsModel.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/23/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation

struct Section {
    // creates a section for the credits table view
    var heading : String
    var items : [String]
    
    init(title: String, objects : [String]) {
        heading = title
        items = objects
    }
}

class Credits {
    
    // MARK: - Photo Credits

    let allPhotoCredits: [String] = [
        "With the exception of the Fire Chief's Truck, all images are licensed under Public Domain and can be found at Pixabay or Wikimedia Commons.",
        EmergencyTrucks.fireChiefsTruckPhotoCredit,
        "The 'More Trucks!' images are provided through the Flickr.com API."]
    
    // MARK: - Video Credits
    
    let generalVideoCredit: String = "All gif images were created from YouTube videos licensed under Creative Commons Attribution Licenses."
    let pointToYouTubeGifs: String = "All gif images can be viewed at: https://www.youtube.com/user/Ginnybx1"
    
    func generateListOfCredits(forGameType gameType: GameType) -> [String] {
        var allCredits: [String] = []
        switch gameType {
        case .Construction:
            for truck in ConstructionTrucks.allConstructionTrucks {
                if let credit = truck.videoCredit {
                    allCredits.append(credit)
                }
            }
        case .Emergency:
            for truck in EmergencyTrucks.allEmergencyTrucks {
                if let credit = truck.videoCredit {
                    allCredits.append(credit)
                }
            }
        case .City:
            for truck in CityTrucks.allCityTrucks {
                if let credit = truck.videoCredit {
                    allCredits.append(credit)
                }
            }
        case .All:
            for truck in Truck.allTrucks {
                if let credit = truck.videoCredit {
                    allCredits.append(credit)
                }
            }
        }
        return allCredits
    }
    
    func generateAllVideoCredits() -> [String] {
        var allCredits: [String] = [generalVideoCredit, pointToYouTubeGifs]
        let gifCredits = generateListOfCredits(forGameType: .All)
        allCredits = allCredits + gifCredits
        return allCredits
    }

}
