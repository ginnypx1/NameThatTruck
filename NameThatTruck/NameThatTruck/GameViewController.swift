//
//  GameViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData
import SwiftyGif

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var winningTruckLabel: UILabel!
    @IBOutlet weak var bottomSignView: UIView!
    @IBOutlet weak var topSignView: UIView!
    @IBOutlet weak var canYouFindLabel: UILabel!
    
    // MARK: - Properties
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var popdownView: PopdownView!
    var blackoutView: UIView!

    var truckSet: [Truck]!
    var gameType: GameType!
    
    var gameTrucks: [Truck]!
    var winningTruck: Truck!
    
    let gifmanager = SwiftyGifManager(memoryLimit:20)
    var soundManager: SoundManager!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add outline to title font
        titleLabel.attributedText = GameDesign.setTitleLabelFont()
        // sign display
        GameDesign.changeSignForGame(forGameType: self.gameType, bottomSignView: self.bottomSignView, topSignView: self.topSignView, winningTruckLabel: self.winningTruckLabel, canYouFindLabel: self.canYouFindLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // start a new game
        createGameBoard()
    }
    
    // MARK: - Create Game Board
    
    func createGameBoard() {
        // start a new game
        var game = Game()
        gameTrucks = game.generateGameSet(withTrucks: self.truckSet)
        game.chooseWinner(from: self.gameTrucks)
        winningTruck = game.winningTruck
        
        // put the name of the selected truck in winningTruckLabel
        winningTruckLabel.text = winningTruck.displayName
        
        // load the collection view
        fitCollectionFlowToSize(self.view.frame.size)
        collectionView.reloadData()
        
        // check for truck entry in core data
        self.delegate.stack.checkForTruckType(truck: winningTruck)
        
        // play Game Prompt
        soundManager.playGamePrompt(forTruck: winningTruck)
    }
    
    // MARK: - Collection View Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // collection view has one section
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // collection view will have six trucks
        return gameTrucks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // load each cell with the image of a random truck
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TruckViewCell", for: indexPath) as! TruckViewCell
        
        let truck = gameTrucks[indexPath.row]
        let truckImage = truck.image
        cell.imageView.image = truckImage
        
        AnimationManager.bounceTruck(cell: cell, duration: 0.5, scale: 0.5)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // animates a bounce effect when the user presses the truck
        guard let cell = collectionView.cellForItem(at: indexPath) as? TruckViewCell else { return }
        
        AnimationManager.bounceTruck(cell: cell, duration: 0.3, scale: 0.9)
        
        // check to see if user selected the winning truck
        let selectedTruck = gameTrucks[indexPath.row]
        print("Selected Truck: \(selectedTruck.displayName)")
        
        // if guess is correct, segue to gif view
        if selectedTruck.name == winningTruck.name {
            print("You got it!")
            self.activateWin(truck: selectedTruck)
            
        } else {
            print("Try again!")
            self.activateLoss(cell: cell, truck: selectedTruck)
        }
    }
    
    // MARK: - Activate Win or Lose
    
    func activateWin(truck: Truck) {
        // audio prompt for win
        soundManager.playResultsAudio(forTruck: truck, win: true)
        
        // create black background
        self.createBlackBackground()
        // popdown view slides in from top of screen
        self.addPopdownView()
        
        // drop down the popdownView
        let dropHeight = (self.view.frame.size.height * 0.15)
        AnimationManager.animateViewPopdown(popdownView: self.popdownView, dropHeight: dropHeight)
        
        // play sound
        self.soundManager.playSoundForGif(selectedTruck: self.winningTruck)
    }
    
    func activateLoss(cell: TruckViewCell, truck: Truck) {
        // shake Truck
        // AnimationManager.shakeTruck(cell: cell)
        // audio prompts for loss
        soundManager.sayName(ofTruck: truck)
    }
    
    // MARK: - Popdown View
    
    func addPopdownView() {
        // make sure there's not already a popdown view on screen
        if (self.popdownView != nil) {
            self.popdownView.view.removeFromSuperview()
        }
        
        let viewWidth = self.view.frame.size.width >= self.view.frame.height ? (self.view.frame.size.height * 0.9) : (self.view.frame.size.width * 0.8)
        
        let viewHeight = self.view.frame.size.width >= self.view.frame.height ? (self.view.frame.size.height * 0.7) : (self.view.frame.size.height * 0.5)
        
        // create the popdown view
        self.popdownView = PopdownView(frame: CGRect(x: (self.view.frame.size.width-viewWidth)/2 , y: -800, width: viewWidth, height: viewHeight))
        
        // Load SwiftyGif and set up the gif manager to play the gif
        let gif = UIImage(gifName: "\(winningTruck.gifString)")
        self.popdownView.imageView.setGifImage(gif, manager: self.gifmanager)
        
        // load other elements of popdown window
        self.popdownView.view.layer.borderColor = GameDesign.constructionOrange.cgColor
        self.popdownView.backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        self.popdownView.moreTrucksButton.setImage(winningTruck.image, for: .normal)
        self.popdownView.moreTrucksButton.addTarget(self, action: #selector(moreTrucksButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(popdownView)
    }
    
    func backButtonPressed(sender: UIButton) {
        // stop audio
        soundManager.stopSound()
        // slide popup view up off screen
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.popdownView.center.y -= 900
        }, completion: { finished in
            // remove the superviews and start a new game
            self.removeSuperviews()
            self.createGameBoard()
        })
    }
    
    func moreTrucksButtonPressed(sender: UIButton) {
        // stop audio
        soundManager.stopQueuedSound()
        // play truck horn sound effect
        soundManager.playTruckHornSoundEffect()
        // segue to photo album view of the winning truck
        self.removeSuperviews()
        // fetch the current truck type from core data
        let truckType = delegate.stack.fetchTruckType(name: self.winningTruck.name)
        // pass it to photo view controller and segue to pictures of trucks
        if let truckType = truckType {
            // segue to photo album
            let photoViewController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
            photoViewController.selectedTruck = self.winningTruck
            photoViewController.truckType = truckType
            photoViewController.soundManager = self.soundManager
            self.navigationController?.pushViewController(photoViewController, animated: true)
        }
    }
    
    // MARK: - Blackout View
    
    func createBlackBackground() {
        // grey out the game board when superview pops up
        self.blackoutView = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height))
        self.blackoutView.backgroundColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 0.5)
        self.view.addSubview(self.blackoutView);
    }
    
    func removeSuperviews() {
        // remove the superviews from the game view
        self.popdownView.removeFromSuperview()
        self.blackoutView.removeFromSuperview()
    }
    
    // MARK: -  Return to Main Menu

    @IBAction func returnToMainMenu(_ sender: Any) {
        // stop sound
        soundManager.stopQueuedSound()
        // return to menu view
        self.navigationController?.popToRootViewController(animated: true)
    }
}

