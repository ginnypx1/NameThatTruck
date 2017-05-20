//
//  CollectionFlowLayout.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

extension GameViewController {
    
    // MARK: - Game Collection View Flow
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // set up custom flow if screen size changes
        if flowLayout != nil {
            fitCollectionFlowToSize(size)
        }
    }
    
    func fitCollectionFlowToSize(_ size: CGSize) {
        // set up collection flow layout
        let space: CGFloat = 3.0
        // adjust dimension to width and height of collectionView
        let collectionViewWidth = size.width - (size.width * 0.1)
        let widthDimension = size.width >= size.height ? (collectionViewWidth - (3*space))/3.0 : (collectionViewWidth - (2*space))/2.0
        let collectionViewHeight = size.height - (size.height * 0.4)
        let heightDimension = size.width >= size.height ? (collectionViewHeight - (2*space))/2.0 : (collectionViewHeight - (3*space))/3.0
        // set up custom flow
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: widthDimension, height: heightDimension)
    }
}

extension PhotoViewController {
    
    // MARK: - Photo Collection View Flow
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // set up custom flow
        if flowLayout != nil {
            fitCollectionFlowToSize(size)
        }
    }
    
    func fitCollectionFlowToSize(_ size: CGSize) {
        // determine the number of and spacing between collection items
        let space: CGFloat = 3.0
        // adjust dimension to width and height of screen
        let dimension = size.width >= size.height ? (size.width - (5*space))/5.0 : (size.width - (2*space))/3.0
        // set up custom flow
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
}
