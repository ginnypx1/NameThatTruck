//
//  SoundManager.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/19/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import AVFoundation

class SoundManager {
    
    var audioPlayer: AVAudioPlayer!
    
    var isMuted: Bool = false
    
    let allHornSounds: [String] = ["truck-horn", "truck-horn1", "truck-horn2"]
    
    func playTruckHornSoundEffect() {
        if !self.isMuted {
            let random = Int(arc4random_uniform(UInt32(self.allHornSounds.count)))
            let truckHorn = self.allHornSounds[random]
            
            let sound = Bundle.main.url(forResource: truckHorn, withExtension: "mp3")
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: sound!)
                guard let player = self.audioPlayer else { return }
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func playSoundForGif(selectedTruck: Truck) {
        if !self.isMuted {
            var sound: URL = Bundle.main.url(forResource: "truck-driving", withExtension: "mp3")!
            
            if EmergencyTrucks.emergencyTrucksWithSirens.contains(selectedTruck.name) {
                // load siren sound
                sound = Bundle.main.url(forResource: "sirens", withExtension: "mp3")!
            } else if EmergencyTruckTypes.MilitaryHelicopter.rawValue == selectedTruck.name ||
                EmergencyTruckTypes.RescueHelicopter.rawValue == selectedTruck.name {
                // load helicopter sound
                sound = Bundle.main.url(forResource: "helicopter", withExtension: "mp3")!
            } else if CityTruckTypes.IceCreamTruck.rawValue == selectedTruck.name {
                sound = Bundle.main.url(forResource: "ice-cream-truck", withExtension: "mp3")!
            }
            
            
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: sound)
                guard let player = self.audioPlayer else { return }
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func stopSound() {
        guard let player = self.audioPlayer else { return }
        player.stop()
    }
    
    
    
}
