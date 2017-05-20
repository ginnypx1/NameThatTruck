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
    
    @IBOutlet weak var toggleSoundButton: UIButton!
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
        
        // check sound preferences
        checkSoundPreferences()
        
        // play soundtrack
        soundManager.playSoundtrack()
    }

    // MARK: - Navigation

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
    
    // MARK: - Sound
    
    func checkSoundPreferences() {
        // check to see if sound is save as on or off, set isMuted to that variable
        soundManager.isMuted = UserDefaults.standard.bool(forKey: "isMuted")
        print("User Sound is Muted: \(soundManager.isMuted)")
        // change image of toggleSoundButton accordingly
        toggleSoundButtonImage()
    }
    
    func toggleSoundButtonImage() {
        // change the image of the sound button according to sound preferences
        if soundManager.isMuted {
            // change image to sound-off
            let soundOffImage = UIImage(named: "sound-off")
            self.toggleSoundButton.setImage(soundOffImage, for: .normal)
        } else {
            // change image to sound-on
            let soundOnImage = UIImage(named: "sound-on")
            self.toggleSoundButton.setImage(soundOnImage, for: .normal)
        }
    }
    
    // MARK: - Create one of four game types
    
    @IBAction func playConstructionTruckGame(_ sender: Any) {
        // play truck horn sound effect
        soundManager.playTruckHornSoundEffect()
        // bounce button when pressed
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            self.constructionGameButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
                self.constructionGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                // segue to construction truck game
                self.truckSet = ConstructionTrucks.allConstructionTrucks
                self.gameType = .Construction
                self.segueToGame()
            })
        })
    }
    
    @IBAction func playEmergencyTruckGame(_ sender: Any) {
        // play truck horn sound effect
        soundManager.playTruckHornSoundEffect()
        // bounce button when pressed
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            self.emergencyGameButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.emergencyGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                // segue to emergency truck game
                self.truckSet = EmergencyTrucks.allEmergencyTrucks
                self.gameType = .Emergency
                self.segueToGame()
            })
        })
    }
    
    @IBAction func playCityTruckGame(_ sender: Any) {
        // play truck horn sound effect
        soundManager.playTruckHornSoundEffect()
        // bounce button when pressed
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            self.cityGameButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.cityGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                // segue to city truck game
                self.truckSet = CityTrucks.allCityTrucks
                self.gameType = .City
                self.segueToGame()
            })
        })
    }

    @IBAction func playAllTrucksGame(_ sender: Any) {
        // play truck horn sound effect
        soundManager.playTruckHornSoundEffect()
        // bounce button when pressed
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            self.allGameButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.allGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                // segue to all trucks game
                self.truckSet = Truck.allTrucks
                self.gameType = .All
                self.segueToGame()
            })
        })
    }
    
    
    @IBAction func toggleSoundOnOrOff(_ sender: Any) {
        if soundManager.isMuted {
            // change it to sound-on (isMuted = false)
            print("Game is no longer muted")
            soundManager.isMuted = false
            UserDefaults.standard.set(false, forKey: "isMuted")
            UserDefaults.standard.synchronize()
            toggleSoundButtonImage()
        } else {
            print("Game will be muted")
            soundManager.isMuted = true
            // change preference to sound-off (isMuted = true)
            UserDefaults.standard.set(true, forKey: "isMuted")
            UserDefaults.standard.synchronize()
            toggleSoundButtonImage()
        }
    }
    
}
