//
//  MenuViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/13/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var constructionGameButton: UIButton!
    @IBOutlet weak var emergencyGameButton: UIButton!
    @IBOutlet weak var cityGameButton: UIButton!
    @IBOutlet weak var allGameButton: UIButton!
    
    // MARK: - Properties
    
    var truckSet: [Truck] = Truck.allTrucks
    var gameType: GameType = .All
    
    var soundManager = SoundManager()
    
    // MARK: - View
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // play soundtrack
        soundManager.playSoundtrack()
    }

    // MARK: - Navigation
    
    func createGameType(truckSet: [Truck], gameType: GameType, button: UIButton) {
        // play truck horn sound effect
        soundManager.playTruckHornSoundEffect()
        // bounce button when pressed
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
                button.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                // segue to game
                self.truckSet = truckSet
                self.gameType = gameType
                self.segueToGame()
            })
        })
    }
    
    func segueToGame() {
        // stop soundtrack
        soundManager.stopSound()
        // segue to game controller
        let gameController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameController.truckSet = self.truckSet
        gameController.gameType = self.gameType
        gameController.soundManager = self.soundManager
        self.navigationController?.pushViewController(gameController, animated: true)
    }
    
    // MARK: - Create one of four game types
    
    @IBAction func playConstructionTruckGame(_ sender: Any) {
        createGameType(truckSet: ConstructionTrucks.allConstructionTrucks, gameType: .Construction, button: self.constructionGameButton)
    }
    
    @IBAction func playEmergencyTruckGame(_ sender: Any) {
        createGameType(truckSet: EmergencyTrucks.allEmergencyTrucks, gameType: .Emergency, button: self.emergencyGameButton)
    }
    
    @IBAction func playCityTruckGame(_ sender: Any) {
        createGameType(truckSet: CityTrucks.allCityTrucks, gameType: .City, button: self.cityGameButton)
    }

    @IBAction func playAllTrucksGame(_ sender: Any) {
        createGameType(truckSet: Truck.allTrucks, gameType: .All, button: self.allGameButton)
    }
    
    // MARK: - Segue to Settings View
    
    @IBAction func changeGameSettings(_ sender: Any) {
        // stop soundtrack
        soundManager.stopSound()
        let settingsController = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        settingsController.soundManager = self.soundManager
        self.present(settingsController, animated: true, completion: nil)
    }
    
}
