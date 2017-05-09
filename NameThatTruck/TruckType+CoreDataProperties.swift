//
//  TruckType+CoreDataProperties.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import CoreData


extension TruckType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TruckType> {
        return NSFetchRequest<TruckType>(entityName: "TruckType")
    }

    @NSManaged public var name: String?
    @NSManaged public var flickrPhotos: NSSet?

}

// MARK: Generated accessors for flickrPhotos
extension TruckType {

    @objc(addFlickrPhotosObject:)
    @NSManaged public func addToFlickrPhotos(_ value: FlickrPhoto)

    @objc(removeFlickrPhotosObject:)
    @NSManaged public func removeFromFlickrPhotos(_ value: FlickrPhoto)

    @objc(addFlickrPhotos:)
    @NSManaged public func addToFlickrPhotos(_ values: NSSet)

    @objc(removeFlickrPhotos:)
    @NSManaged public func removeFromFlickrPhotos(_ values: NSSet)

}
