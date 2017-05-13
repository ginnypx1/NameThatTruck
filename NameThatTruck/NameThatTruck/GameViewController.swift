//
//  GameViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit
import CoreData

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var winningTruckLabel: UILabel!
    
    // MARK: - Properties
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var popdownView: PopdownView!
    var blackoutView: UIView!

    var truckSet: [Truck]!
    var gameTrucks: [Truck]!
    var winningTruck: Truck!
    
    // MARK: - View
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // start a new game
        createGameBoard()
    }
    
    // MARK: - Create Game Board
    
    func createGameBoard() {
        // start a new game
        let game = Game()
        gameTrucks = game.generateGameSet(withTrucks: self.truckSet)
        winningTruck = game.chooseWinner(from: self.gameTrucks)
        
        // put the name of the selected truck in winningTruckLabel
        winningTruckLabel.text = winningTruck.displayName
        
        // load the collection view
        fitCollectionFlowToSize(self.view.frame.size)
        collectionView.reloadData()
        
        // check for truck entry in core data
        checkForTruckType()
    }
    
    // MARK: - TruckType Entity
    
    func checkForTruckType() {
        // if selected truck type can't be retrieved, one is created
        if let truckExists = self.delegate.stack.fetchTruckType(name: self.winningTruck.name) {
            print("Retrieved \(String(describing: truckExists.name)) from core data.")
        } else {
            print("No truck type found. Creating new core data object.")
            self.delegate.stack.addTruckTypeToDatabase(name: self.winningTruck.name)
        }
    }
    
    // MARK: - Animations
    
    func bounceTruck(cell: UICollectionViewCell, duration: TimeInterval, scale: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { finished in
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: nil)
        })
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
        
        bounceTruck(cell: cell, duration: 0.5, scale: 0.5)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // animates a bounce effect when the user presses the truck
        let cell = collectionView.cellForItem(at: indexPath)
        
        bounceTruck(cell: cell!, duration: 0.3, scale: 0.9)
        
        // check to see if user selected the winning truck
        let selectedTruck = gameTrucks[indexPath.row]
        print("Selected Truck: \(selectedTruck.displayName)")
        
        // if guess is correct, segue to gif view
        if selectedTruck.name == winningTruck.name {
            print("You got it!")
            
            // TODO: Load SwiftyGif and set up the gif manager to play the gif
            //        let gifmanager = SwiftyGifManager(memoryLimit:20)
            //        let gif = UIImage(gifName: "\(selectedTruck.gifString)")
            //        print("Gif is \(selectedTruck.gifString)")
            //        self.imageView.setGifImage(gif, manager: gifmanager)
            
            // create black background
            self.createBlackBackground()
            // popdown view slides in from top of screen
            self.addPopdownView()
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.popdownView.center.y += 900
            }, completion: nil)
            
        // if guess is incorrect, say name of truck and ask the question again
        } else {
            // TODO: Say the name of the selected truck
            // TODO: Ask about the winning truck again
            print("Try again!")
        }
    }
    
    // MARK: - Popdown View
    
    func addPopdownView() {
        // make sure there's not already a popdown view on screen
        if (self.popdownView != nil) {
            self.popdownView.view.removeFromSuperview()
        }
        // get the height and width proportions of the view
        let viewWidth = (self.view.frame.size.width * 0.8)
        let viewHeight = (self.view.frame.size.height * 0.66)
        // create the popdown view
        self.popdownView = PopdownView(frame: CGRect(x: (self.view.frame.size.width-viewWidth)/2 , y: -800, width: viewWidth, height: viewHeight))
        self.popdownView.imageView.image = winningTruck.image
        self.popdownView.backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        self.popdownView.moreTrucksButton.addTarget(self, action: #selector(moreTrucksButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(popdownView)
    }
    
    func backButtonPressed(sender: UIButton) {
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
        // segue to photo album view of the winning truck
        print("Getting pictures of trucks...")
        
        removeSuperviews()
        
        // fetch the current truck type from core data
        let truckType = delegate.stack.fetchTruckType(name: self.winningTruck.name)
        // pass it to photo view controller and segue to pictures of trucks
        if let truckType = truckType {
            let photoViewController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
            photoViewController.selectedTruck = self.winningTruck
            photoViewController.truckType = truckType
            self.navigationController?.pushViewController(photoViewController, animated: true)
        }
    }
    
    // MARK - Blackout View
    
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

}

