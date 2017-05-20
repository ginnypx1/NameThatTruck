//
//  PhotoViewCell.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    let backgroundImage = UIImage(named: "collection-view-background-image")
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update(with: self.backgroundImage)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        update(with: self.backgroundImage)
    }
    
    // MARK: - Show Activity Indicator
    
    func update(with image: UIImage?) {
        if image == backgroundImage {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
            imageView.image = image
        }
    }
    
}
