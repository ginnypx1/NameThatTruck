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
    
    var truckSet: [Truck] = allConstructionTrucks
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Navigation

    func segueToGame() {
        let gameController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameController.truckSet = self.truckSet
        self.navigationController?.pushViewController(gameController, animated: true)
    }
    
    // MARK: - Button Actions
    
    @IBAction func playConstructionTruckGame(_ sender: Any) {
        // segue to game with construction trucks
        truckSet = allConstructionTrucks
        segueToGame()
    }
    
    @IBAction func playEmergencyTruckGame(_ sender: Any) {
        // segue to game with emergency trucks
        truckSet = allEmergencyTrucks
        segueToGame()
    }
    
    @IBAction func playCityTruckGame(_ sender: Any) {
        // segue to game with city trucks
        truckSet = allCityTrucks
        segueToGame()
    }
    

    @IBAction func playAllTrucksGame(_ sender: Any) {
        // segue to game with all trucks
        truckSet = Truck.allTrucks
        segueToGame()
    }

}
