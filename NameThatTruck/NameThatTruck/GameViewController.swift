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

    var gameTrucks: [Truck]!
    var winningTruck: Truck!
    
    // MARK: - View
    
    override func viewWillAppear(_ animated: Bool) {
        
        // start a new game
        let game = Game()
        gameTrucks = game.generateGameSet()
        winningTruck = game.chooseWinner(from: self.gameTrucks)
        
        // put the name of the selected truck in winningTruckLabel
        winningTruckLabel.text = winningTruck.displayName
        
        // load the collection view
        fitCollectionFlowToSize(self.view.frame.size)
        collectionView.reloadData()
        
        // check for core data entry, or add one
        checkForTruckType()
    }
    
    // MARK: - TruckType Entity
    
    func checkForTruckType() {
        // if selected truck type can't be retrieved, one is created
        let truckTypeFetchRequest = NSFetchRequest<TruckType>(entityName: "TruckType")
        let predicate = NSPredicate(format: "name == %@", argumentArray: [self.winningTruck.name])
        truckTypeFetchRequest.predicate = predicate
        do {
            let selectedTruck = try self.delegate.stack.context.fetch(truckTypeFetchRequest)
            if selectedTruck.count != 0 {
                print("Retrieved \(selectedTruck[0]) from core data.")
            } else {
                print("No truck type found. Creating new core data object.")
                self.delegate.stack.addTruckTypeToDatabase(name: self.winningTruck.name)
            }
        } catch {
            print("There was an error fetching the truck type from core data.")
        }
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // check to see if user selected the winning truck
        let selectedTruck = gameTrucks[indexPath.row]
        print("Selected Truck: \(selectedTruck.displayName)")
        
        // if guess is correct, segue to gif view
        if selectedTruck.name == winningTruck.name {
            print("You got it!")
            let gifViewController = self.storyboard?.instantiateViewController(withIdentifier: "GifViewController") as! GifViewController
            gifViewController.selectedTruck = self.winningTruck
            self.navigationController?.pushViewController(gifViewController, animated: true)
        // if guess is incorrect, say name of truck and ask the question again
        } else {
            // TODO: Say the name of the selected truck
            // TODO: Ask about the winning truck again
            print("Try again!")
        }
    }


}

