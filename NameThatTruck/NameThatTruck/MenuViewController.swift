//
//  MenuViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/13/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Properties
    
    var truckSet: [Truck] = Truck.allTrucks
    var gameType: GameType = .All

    // MARK: - Navigation

    func segueToGame() {
        let gameController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameController.truckSet = self.truckSet
        gameController.gameType = self.gameType
        self.navigationController?.pushViewController(gameController, animated: true)
    }
    
    // MARK: - Create one of four game types
    
    @IBAction func playConstructionTruckGame(_ sender: Any) {
        // segue to game with construction trucks
        truckSet = ConstructionTrucks.allConstructionTrucks
        gameType = .Construction
        segueToGame()
    }
    
    @IBAction func playEmergencyTruckGame(_ sender: Any) {
        // segue to game with emergency trucks
        truckSet = EmergencyTrucks.allEmergencyTrucks
        gameType = .Emergency
        segueToGame()
    }
    
    @IBAction func playCityTruckGame(_ sender: Any) {
        // segue to game with city trucks
        truckSet = CityTrucks.allCityTrucks
        gameType = .City
        segueToGame()
    }

    @IBAction func playAllTrucksGame(_ sender: Any) {
        // segue to game with all trucks
        truckSet = Truck.allTrucks
        gameType = .All
        segueToGame()
    }

}
