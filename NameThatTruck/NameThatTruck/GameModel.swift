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

struct GameDesign {
    // game colors
    static let roadSignRed = UIColor(red: 192/255, green: 0, blue: 0, alpha: 1)
    static let constructionOrange = UIColor(red: 250/255, green: 99/255, blue: 2/255, alpha: 1)
    static let constructionYellow = UIColor(red: 247/255, green: 212/255, blue: 23/255, alpha: 1)
    static let roadSignGreen = UIColor(red: 0, green: 153/255, blue: 0, alpha: 1)
    static let roadSignBlue = UIColor(red: 0, green: 0, blue: 254/255, alpha: 1)
    
    static func setTitleLabelFont() -> NSMutableAttributedString {
        // adds an outline to the title label font
        let mutableString = NSMutableAttributedString(string: "NAME THAT TRUCK", attributes: [
            NSStrokeColorAttributeName: UIColor.black,
            NSForegroundColorAttributeName: UIColor.orange,
            NSStrokeWidthAttributeName: -1.0])
        return mutableString
    }
}

struct Game {
    
    // MARK: - Properties
    
    var winningTruck: Truck?
    var lastWinner: Truck?
    
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
        
        if let winningTruck = winningTruck, var lastWinner = lastWinner {
            if winningTruck.name == lastWinner.name {
                chooseWinner(from: gameTrucks)
            } else {
                lastWinner = winningTruck
            }
        }
        print("Winning truck: \(String(describing: winningTruck?.displayName))")
    }
    
}
