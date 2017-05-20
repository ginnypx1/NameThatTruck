//
//  PhotoViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit
import CoreData
import SystemConfiguration

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, NSFetchedResultsControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var noImagesLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    var truckType: TruckType!
    var selectedTruck: Truck!
    
    var soundManager: SoundManager!
    
    var photoView: PhotoView!
    var blackoutView: UIView!
    
    // API call
    var flickrClient = FlickrClient()
    
    // fetched results controller
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var fetchedResultsController: NSFetchedResultsController<FlickrPhoto> = { () -> NSFetchedResultsController<FlickrPhoto> in
        let fetchRequest = NSFetchRequest<FlickrPhoto>(entityName: "FlickrPhoto")
        fetchRequest.sortDescriptors = []
        let predicate = NSPredicate(format: "truckType = %@", argumentArray: [self.truckType])
        fetchRequest.predicate = predicate
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.delegate.stack.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    var selectedIndexes = [IndexPath]()
    var insertedIndexPaths: [IndexPath]!
    var deletedIndexPaths: [IndexPath]!
    var updatedIndexPaths: [IndexPath]!
    
    // activity indicator
    var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Truck Type is: \(self.truckType.name!)")
        
        // add outline to title font
        titleLabel.attributedText = GameDesign.setTitleLabelFont()
        // hide noImagesLabel
        noImagesLabel.isHidden = true
        // set button label
        if selectedTruck.name != CityTruckTypes.SchoolBus.rawValue {
            collectionButton.setTitle("See More \(self.selectedTruck.displayName)s!", for: .normal)
        } else {
            collectionButton.setTitle("See More \(self.selectedTruck.displayName)es!", for: .normal)
        }
        // add activity indicator
        addActivityIndicator()
        // set up custom flow
        fitCollectionFlowToSize(self.view.frame.size)
        
        // start the fetched results controller
        do {
            try fetchedResultsController.performFetch()
            // if empty, download images
            if self.fetchedResultsController.fetchedObjects?.count == 0 {
                print("Need to fetch images.")
                fetchImages()
            } else {
                print("There were \(String(describing: self.fetchedResultsController.fetchedObjects?.count)) images found.")
            }
        } catch {
            print("Error performing initial fetch for album photos.")
        }
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
    
    // MARK: - Collection View
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // loads number of sections or 0
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // loads the number of FlickrImages found for this Truck for tType
        let sectionInfo = self.fetchedResultsController.sections![section]
        print("number Of Cells: \(sectionInfo.numberOfObjects)")
        return sectionInfo.numberOfObjects
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // play truck horn sound
        soundManager.playTruckHornSoundEffect()
        
        // grab selected image
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoViewCell else { return }
        guard let selectedImage = cell.imageView.image else { return }
        
        // create black background
        self.createBlackBackground()
        // popdown view slides in from top of screen
        self.addPhotoView(withImage: selectedImage)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // load images fetched from Flickr in the cells
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewCell", for: indexPath) as! PhotoViewCell
        
        if self.fetchedResultsController.fetchedObjects?.count != 0 {
            let flickrPhoto = self.fetchedResultsController.object(at: indexPath) as FlickrPhoto
            if flickrPhoto.imageData != nil {
                // make an image from the core data store
                let photo = UIImage(data: flickrPhoto.imageData! as Data)
                cell.update(with: photo)
            } else {
                // download and store the image
                flickrClient.fetchImage(for: flickrPhoto) { (data: Data?) -> Void in
                    print("6. Fetching image data for photo...")
                    // return on main thread
                    guard let imageData = data, let image = UIImage(data: imageData) else {
                        print("Image data could not be extracted")
                        return
                    }
                    let photoIndexPath = IndexPath(item: indexPath.row, section: 0)
                    if let cell = self.collectionView.cellForItem(at: photoIndexPath)
                        as? PhotoViewCell {
                        cell.update(with: image)
                        print("7. displaying photo")
                    }
                }
            }
        }
        return cell
    }
    
    
    // MARK: - Fetched Results Controller Delegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        insertedIndexPaths = [IndexPath]()
        deletedIndexPaths = [IndexPath]()
        updatedIndexPaths = [IndexPath]()
        
        print("in controllerWillChangeContent")
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            print("Insert an item")
            insertedIndexPaths.append(newIndexPath!)
            break
        case .delete:
            print("Delete an item")
            deletedIndexPaths.append(indexPath!)
            break
        case .update:
            print("Update an item.")
            updatedIndexPaths.append(indexPath!)
            break
        case .move:
            print("Move an item. We don't expect to see this in this app.")
            break
            //default:
            //break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("in controllerDidChangeContent. changes.count: \(insertedIndexPaths.count + deletedIndexPaths.count)")
        
        collectionView.performBatchUpdates({() -> Void in
            for indexPath in self.insertedIndexPaths {
                self.collectionView.insertItems(at: [indexPath])
            }
            for indexPath in self.deletedIndexPaths {
                self.collectionView.deleteItems(at: [indexPath])
            }
            for indexPath in self.updatedIndexPaths {
                self.collectionView.reloadItems(at: [indexPath])
            }
        }, completion: nil)
    }
    
    // MARK: - Fetch Images from Flickr
    
    func fetchImages() {
        // change UI to indicate loading
        activityIndicator.startAnimating()
        collectionButton.isEnabled = false
        noImagesLabel.isHidden = true
        
        print("1. Starting request for photos...")
        // retrieve images from flickr
        flickrClient.fetchImagesWithSearchTag(tag: self.selectedTruck.searchTag) { (data: AnyObject?, error: NSError?) -> Void in
            // returned from JSON parsing on main thread
            
            if error != nil {
                print("There was an error getting the images: \(String(describing: error))")
                self.activityIndicator.stopAnimating()
                if isInternetAvailable() == false {
                    Alerts.displayInternetConnectionAlert(from: self)
                } else {
                    Alerts.displayStandardAlert(from: self)
                }
                self.collectionButton.isEnabled = true
            } else {
                guard let data = data else {
                    print("No data was returned.")
                    return
                }
                let photoURLs = self.flickrClient.extractAllPhotoURLStrings(fromJSONDictionary: data)
                
                if !photoURLs.isEmpty {
                    print("5. There were \(photoURLs.count) photos returned.")
                    for url in photoURLs {
                        self.delegate.stack.addFlickrPhotoToDatabase(urlString: url, truckType: self.truckType, fetchedResultsController: self.fetchedResultsController)
                        self.activityIndicator.stopAnimating()
                        self.collectionButton.isEnabled = true
                    }
                } else {
                    self.noImagesLabel.isHidden = false
                    self.activityIndicator.stopAnimating()
                    self.collectionButton.isEnabled = true
                }
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
            
            // save the data
            do {
                try self.delegate.stack.saveContext()
            } catch {
                print("New collection changes could not be saved.")
            }
        }
    }
    
    // MARK: - Photo View
    
    func addPhotoView(withImage image: UIImage) {
        // make sure there's not already a photo view on screen
        if (self.photoView != nil) {
            self.photoView.view.removeFromSuperview()
        }
        // find the size classes
        // let horizontalClass = self.traitCollection.horizontalSizeClass
        let verticalClass = self.traitCollection.verticalSizeClass
        
        // view sized for regular height devices
        var viewWidth = (self.view.frame.size.width * 0.8)
        var viewHeight = viewWidth
        
        if verticalClass == UIUserInterfaceSizeClass.compact {
            // resize view for compact height
            viewHeight = (self.view.frame.size.height * 0.8)
            viewWidth = viewHeight
        }
        
        // create the popdown view
        self.photoView = PhotoView(frame: CGRect(x: (self.view.frame.size.width-viewWidth)/2 , y: (self.view.frame.size.height-viewHeight)/2, width: viewWidth, height: viewHeight))
        
        // Load cell's image as photoView's image
        self.photoView.imageView.image = image
        
        self.photoView.view.layer.borderColor = GameDesign.constructionOrange.cgColor
        self.photoView.backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(photoView)
    }
    
    func backButtonPressed(sender: UIButton) {
        // slide photo view up off screen
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.photoView.center.y -= 900
        }, completion: { finished in
            // remove the superviews
            self.removeSuperviews()
        })
    }
    
    func createBlackBackground() {
        // grey out the photo album when superview pops up
        self.blackoutView = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height))
        self.blackoutView.backgroundColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 0.5)
        self.view.addSubview(self.blackoutView);
    }
    
    func removeSuperviews() {
        // remove the superviews from the photo album view
        self.photoView.removeFromSuperview()
        self.blackoutView.removeFromSuperview()
    }
    
    // MARK: - Remove Selected Photos
    
    func deleteAllFlickrPhotos() {
        for photo in self.fetchedResultsController.fetchedObjects! {
            delegate.stack.context.delete(photo)
        }
    }
    
    // MARK: - Import New Photos or Delete
    
    @IBAction func importNewPhotos(_ sender: Any) {
        // truck horn sound effect
        soundManager.playTruckHornSoundEffect()
        // animate
        bounceButton(button: self.collectionButton, duration: 0.5, scale: 0.3)
        // disable button while new photos load
        collectionButton.isEnabled = false
        // delete saved images
        deleteAllFlickrPhotos()
        // fetch new images
        fetchImages()
    }
    
    @IBAction func returnToGame(_ sender: Any) {
        // return to game view
        self.navigationController?.popViewController(animated: true)
    }
}
