//
//  GameViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var winningTruckLabel: UILabel!
    
    // MARK: - Properties

    var gameTrucks: [Truck]!
    var winningTruck: Truck!
    
    // MARK: - View
    
    override func viewWillAppear(_ animated: Bool) {
        
        let game = Game()
        gameTrucks = game.generateGameSet()
        winningTruck = game.chooseWinner(from: self.gameTrucks)
        
        winningTruckLabel.text = winningTruck.displayName
        
        fitCollectionFlowToSize(self.view.frame.size)
        
        collectionView.reloadData()
    }
    
    // MARK: - Collection View Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameTrucks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TruckViewCell", for: indexPath) as! TruckViewCell
        
        let truck = gameTrucks[indexPath.row]
        let truckImage = truck.image
        cell.imageView.image = truckImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedTruck = gameTrucks[indexPath.row]
        print("Selected Truck: \(selectedTruck.displayName)")
        
        if selectedTruck.name == winningTruck.name {
            print("You got it!")
            let gifViewController = self.storyboard?.instantiateViewController(withIdentifier: "GifViewController") as! GifViewController
            gifViewController.selectedTruck = self.winningTruck
            self.navigationController?.pushViewController(gifViewController, animated: true)
        } else {
            print("Try again!")
        }
    }
    
    // MARK: - Collection View Flow
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // set up custom flow
        if flowLayout != nil {
            fitCollectionFlowToSize(size)
        }
    }
    
    func fitCollectionFlowToSize(_ size: CGSize) {
        let space: CGFloat = 3.0
        // adjust dimension to width and height of screen
        let collectionViewWidth = size.width - (size.width * 0.1)
        let widthDimension = size.width >= size.height ? (collectionViewWidth - (3*space))/3.0 : (collectionViewWidth - (2*space))/2.0
        let collectionViewHeight = size.height - (size.height * 0.25)
        let heightDimension = size.width >= size.height ? (collectionViewHeight - (2*space))/2.0 : (collectionViewHeight - (3*space))/3.0
        // set up custom flow
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: widthDimension, height: heightDimension)
    }


}

