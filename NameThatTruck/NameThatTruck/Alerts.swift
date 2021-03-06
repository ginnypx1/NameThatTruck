//
//  Alerts.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

// MARK: - Alerts

class Alerts {
    
    static func displayInternetConnectionAlert(from viewController: UIViewController) {
        // display Internet Out alert
        let alertController = UIAlertController(title: "No Internet Connection", message: "Please Make Sure Your Device is Connected to the Internet.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { (action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        // Change font of the title and message
        let messageFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 14)! ]
        let attributedMessage = NSMutableAttributedString(string: "Please Make Sure Your Device is Connected to the Internet.", attributes: messageFont)
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        // add actions to alert controller
        alertController.addAction(dismissAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func displayStandardAlert(from viewController: UIViewController) {
        // alert there was an error downloading the images
        let alertController = UIAlertController(title: nil, message: "There Was an Error Retrieving the Images. Please Try Again.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { (action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        // Change font of the title and message
        let messageFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 14)! ]
        let attributedMessage = NSMutableAttributedString(string: "There Was an Error Retrieving the Images. Please Try Again.", attributes: messageFont)
        alertController.setValue(attributedMessage, forKey: "attributedMessage")
        
        // add actions to alert controller
        alertController.addAction(dismissAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
