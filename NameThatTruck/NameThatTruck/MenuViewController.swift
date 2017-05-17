//
//  MenuViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/13/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var constructionGameButton: UIButton!
    @IBOutlet weak var emergencyGameButton: UIButton!
    @IBOutlet weak var cityGameButton: UIButton!
    @IBOutlet weak var allGameButton: UIButton!
    
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
    
    // MARK: - Animations
    
    func bounceButton(button: UIButton, duration: TimeInterval, scale: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            button.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { finished in
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                button.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: nil)
        })
    }
    
    // MARK: - Create one of four game types
    
    @IBAction func playConstructionTruckGame(_ sender: Any) {
        // segue to game with construction trucks
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            self.constructionGameButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
                self.constructionGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                self.truckSet = ConstructionTrucks.allConstructionTrucks
                self.gameType = .Construction
                self.segueToGame()
            })
        })
    }
    
    @IBAction func playEmergencyTruckGame(_ sender: Any) {
        // segue to game with emergency trucks
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            self.emergencyGameButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.emergencyGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                self.truckSet = EmergencyTrucks.allEmergencyTrucks
                self.gameType = .Emergency
                self.segueToGame()
            })
        })
    }
    
    @IBAction func playCityTruckGame(_ sender: Any) {
        // segue to game with city trucks
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            self.cityGameButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.cityGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                self.truckSet = CityTrucks.allCityTrucks
                self.gameType = .City
                self.segueToGame()
            })
        })
        
    }

    @IBAction func playAllTrucksGame(_ sender: Any) {
        // segue to game with all trucks
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            self.allGameButton.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.allGameButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: { finished in
                self.truckSet = Truck.allTrucks
                self.gameType = .All
                self.segueToGame()
            })
        })
    }

}
