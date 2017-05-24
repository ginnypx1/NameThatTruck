//
//  AnimationManager.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/22/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class AnimationManager {
    
    // MARK: - Bounce Buttons
    
    static func bounceButton(button: UIButton, duration: TimeInterval, scale: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            button.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { finished in
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                button.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: nil)
        })
    }
    
    // MARK: - Bounce Trucks
    
    static func bounceTruck(cell: UICollectionViewCell, duration: TimeInterval, scale: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { finished in
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: nil)
        })
    }
    
    // MARK: - Animate Pop Up Views
    
    static func animateViewPopdown(popdownView: UIView, dropHeight: CGFloat) {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            popdownView.center.y += (800 + dropHeight)
        }, completion: nil)
    }
}
