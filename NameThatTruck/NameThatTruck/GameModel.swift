//
//  GameModel.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

enum GameType {
    case Construction
    case Emergency
    case City
    case All
}

struct Game {
    
    // MARK: - Properties
    
    var winningTruck: Truck?
    
    // MARK: - Methods
    
    // generate a set of random trucks
    func generateGameSet(withTrucks truckSet: [Truck]) -> [Truck] {
        var shuffledTrucks = shuffle(trucks: truckSet)
        var gameTrucks: [Truck] = []
        for i in 0...5 {
            let truck = shuffledTrucks[i]
            gameTrucks.append(truck)
            print("\(truck.name) added to game board")
        }
        return gameTrucks
    }
    
    // shuffle the trucks
    func shuffle(trucks: [Truck]) -> [Truck] {
        var trucks = trucks
        var shuffledArray: [Truck] = []
        while trucks.count > 0 {
            let i = Int(arc4random_uniform(UInt32(trucks.count)))
            let truck = trucks.remove(at: i)
            shuffledArray.append(truck)
        }
        return shuffledArray
    }
    
    // choose a winner
    mutating func chooseWinner(from gameTrucks: [Truck]) {
        let random = Int(arc4random_uniform(UInt32(gameTrucks.count)))
        winningTruck = gameTrucks[random]
        
        if let winningTruck = winningTruck {
            // if lastSelectedTruck exists
            if let lastSelectedTruck = Truck.lastSelectedTruck {
                // check to see if the winning truck was the last selected
                if winningTruck.name == lastSelectedTruck.name {
                    chooseWinner(from: gameTrucks)
                } else {
                    Truck.lastSelectedTruck = winningTruck
                }
            } else {
                Truck.lastSelectedTruck = winningTruck
            }
        }
        
        print("Winning truck: \(String(describing: winningTruck?.displayName))")
    }
    
}
