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
    var playerQueue: AVQueuePlayer!
    
    var isMuted: Bool = false
    
    let allHornSounds: [String] = ["truck-horn", "truck-horn1", "truck-horn2"]
    
    let findPrompts: [String] = ["can-you-find-the", "which-truck-is-the"]
    let winPrompts: [String] = ["good-job", "thats-right"]
    let tryAgainPrompts: [String] = ["that-truck-is-a", "you-touched-the"]
    
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
    
    func playGamePrompt(forTruck truck: Truck) {
        if !self.isMuted {
            
            let gamePrompt: String
            if Truck.notTrucks.contains(truck.name) {
                gamePrompt = "can-you-find-the"
            } else {
                let random = Int(arc4random_uniform(UInt32(self.findPrompts.count)))
                gamePrompt = self.findPrompts[random]
            }
            
            var audioItems: [AVPlayerItem] = []
            
            if let sound1 = Bundle.main.url(forResource: gamePrompt, withExtension: "aac"),
                let sound2 = Bundle.main.url(forResource: truck.name, withExtension: "aac") {
                
                let item1 = AVPlayerItem.init(url: sound1)
                let item2 = AVPlayerItem.init(url: sound2)
                
                audioItems.append(item1)
                audioItems.append(item2)
            }
            
            self.playerQueue = AVQueuePlayer(items: audioItems)
            self.playerQueue.play()
        }
    }
    
    func sayName(ofTruck truck: Truck) {
        if !self.isMuted {
            let sound = Bundle.main.url(forResource: truck.name, withExtension: "aac")
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

    
    // MARK: - Win or Lose Audio
    
    func playResultsAudio(forTruck truck: Truck, win: Bool) {
        if !self.isMuted {
            // check for correct or incorrect identification
            var result: String
            if win {
                let random = Int(arc4random_uniform(UInt32(self.winPrompts.count)))
                result = self.winPrompts[random]
            } else {
                let random = Int(arc4random_uniform(UInt32(self.tryAgainPrompts.count)))
                result = self.tryAgainPrompts[random]
            }
            
            var audioItems: [AVPlayerItem] = []
            
            if let sound1 = Bundle.main.url(forResource: result, withExtension: "aac"),
               let sound2 = Bundle.main.url(forResource: truck.name, withExtension: "aac") {
                
                let item1 = AVPlayerItem.init(url: sound1)
                let item2 = AVPlayerItem.init(url: sound2)
                
                audioItems.append(item1)
                audioItems.append(item2)
            }
            
            self.playerQueue = AVQueuePlayer(items: audioItems)
            self.playerQueue.play()
        }
    }
    
    // MARK: - Stop Sound
    
    func stopSound() {
        guard let player = self.audioPlayer else { return }
        player.stop()
    }
    
    
    
}
