//
//  GifViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/8/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit
// import SwiftyGif

class GifViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moreTrucksButton: UIButton!
    
    // MARK: - Properties
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var selectedTruck: Truck!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = selectedTruck.image
        
        // TODO: Load SwiftyGif and set up the gif manager to play the gif
//        let gifmanager = SwiftyGifManager(memoryLimit:20)
//        let gif = UIImage(gifName: "\(selectedTruck.gifString)")
//        print("Gif is \(selectedTruck.gifString)")
//        self.imageView.setGifImage(gif, manager: gifmanager)
        
        configureButton()
        
    }
    
    func configureButton() {
        // configure the moreTrucksButton with the selectedTruck name
        moreTrucksButton.setTitle("See More \(selectedTruck.displayName)s!", for: .normal)
    }
    
    // MARK: - Segue to Truck View
    
    @IBAction func seeMoreTrucks(_ sender: Any) {
        print("Getting pictures of trucks...")
        
        let truckType = delegate.stack.fetchTruckType(name: self.selectedTruck.name)
        
        if let truckType = truckType {
            let photoViewController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
            photoViewController.selectedTruck = self.selectedTruck
            photoViewController.truckType = truckType
            self.navigationController?.pushViewController(photoViewController, animated: true)
        }
        
    }
    
}
