//
//  GifViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit
import SwiftyGif

class GifViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moreTrucksButton: UIButton!
    
    // MARK: - Properties
    
    var selectedTruck: Truck!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up the gif manager
        let gifmanager = SwiftyGifManager(memoryLimit:20)
        let gif = UIImage(gifName: "\(selectedTruck.gifString)")
        print("Gif is \(selectedTruck.gifString)")
        self.imageView.setGifImage(gif, manager: gifmanager)
        
        configureButton()
        
    }
    
    func configureButton() {
        moreTrucksButton.setTitle("See More \(selectedTruck.displayName)s!", for: .normal)
    }
    
    // MARK: - Segue to Truck View
    
    @IBAction func seeMoreTrucks(_ sender: Any) {
        print("Getting pictures of trucks...")
    }
    
}
