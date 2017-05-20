//
//  SoundManager.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/19/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import AVFoundation

class SoundManager {
    
    // MARK: - Properties
    
    var audioPlayer: AVAudioPlayer!
    var isMuted: Bool = false
    
    let allHornSounds: [String] = ["truck-horn", "truck-horn1", "truck-horn2"]
    
    // TODO: ADD AUDIO FILES
    let findPrompts: [String] = []
    let winPrompts: [String] = []
    let tryAgainPrompts: [String] = []
    
    // MARK: - Soundtrack
    
    func playSoundtrack() {
        if !self.isMuted {
            let sound = Bundle.main.url(forResource: "trucks-are-on-the-road", withExtension: "m4a")
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: sound!)
                guard let player = self.audioPlayer else { return }
                player.numberOfLoops = -1
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Truck Horn Sound Effects
    
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
    
    // MARK: - Gif Sound
    
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
                player.numberOfLoops = -1
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Game Prompt
    
    func startGamePrompt() {
        if !self.isMuted {
            let random = Int(arc4random_uniform(UInt32(self.findPrompts.count)))
            let findPrompt = self.findPrompts[random]
            
            let sound = Bundle.main.url(forResource: findPrompt, withExtension: "mp3")
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
    
    func sayName(ofTruck truck: Truck) {
        if !self.isMuted {
            let sound = Bundle.main.url(forResource: truck.name, withExtension: "mp3")
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
    
    func playGamePrompt(forTruck truck: Truck) {
        startGamePrompt()
        sayName(ofTruck: truck)
    }
    
    // MARK: - Win or Lose Audio
    
    func startResultsAudio(win: Bool) {
        if !self.isMuted {
            // check for correct or incorrect identification
            var result: String = ""
            if win {
                let random = Int(arc4random_uniform(UInt32(self.winPrompts.count)))
                result = self.winPrompts[random]
            } else {
                let random = Int(arc4random_uniform(UInt32(self.tryAgainPrompts.count)))
                result = self.tryAgainPrompts[random]
            }
            
            let sound = Bundle.main.url(forResource: result, withExtension: "mp3")
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
    
    func playResults(win: Bool, forTruck truck: Truck) {
        startResultsAudio(win: win)
        sayName(ofTruck: truck)
    }
    
    // MARK: - Stop Sound
    
    func stopSound() {
        guard let player = self.audioPlayer else { return }
        player.stop()
    }
    
    
    
}
