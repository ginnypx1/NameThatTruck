//
//  FlickrClient.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

class FlickrClient : NSObject {
    
    // MARK: - Properties
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var session = URLSession.shared
    var flickrRequest = FlickrRequest()
    
    var pageRequested: Int = 0
    
    // MARK: - Fetch all Images with SearchText
    
    func fetchImagesWithSearchTag(tag: String, completionHandler: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        pageRequested += 1
        
        /* Set the Parameters */
        var methodParameters: [String: Any] = [
            FlickrRequest.FlickrParameterKeys.SearchTag: tag,
            FlickrRequest.FlickrParameterKeys.ResultsPage: pageRequested]
        
        /* Build the URL */
        var getRequestURL = flickrRequest.buildURL(fromParameters: methodParameters)
        
        /* Configure the request */
        let request = URLRequest(url: getRequestURL)
        
        // create network request
        let task = session.dataTask(with: request) { (data, response, error) in
            
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandler(nil, NSError(domain: "getImagesWithSearchText", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(String(describing: error))")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            /* Log the call */
            print("Request to \(getRequestURL) returned a \(statusCode) response.)")
            
            /* Parse the Parse data and use the data (happens in completion handler) */
            self.parseJSONDataWithCompletionHandler(data, completionHandlerForData: completionHandler)
        }
        task.resume()
    }
    
    // MARK: - Fetch single image from URL
    
    func fetchImage(for flickrPhoto: FlickrPhoto, completionHandler: @escaping (_ data: Data?) -> Void) {
        
        /* Build the URL */
        let photoURLString = flickrPhoto.urlString
        let photoURL = URL(string: photoURLString!)
        
        /* Configure the request */
        let request = URLRequest(url: photoURL!)
        
        // create network request
        let task = session.dataTask(with: request) { (data, response, error) in
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                print("There was an error with your request: \(String(describing: error))")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                print("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            /* Log the call */
            print("Request to \(photoURL!) returned a \(statusCode) response.)")
            
            /* Save image and return to main queue to load images */
            OperationQueue.main.addOperation {
                // add to cache
                guard let image = UIImage(data: data) else {
                    print("Image data could not be extracted")
                    return
                }
                self.delegate.imageCache.setObject(image, forKey: photoURLString as AnyObject)
                
                completionHandler(data)
            }
        }
        task.resume()
    }
    
}
