//
//  PhotoView.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/20/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

@IBDesignable class PhotoView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Properties
    
    var view: UIView!
    
    // MARK: - Load Popdown View
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PhotoView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }

}
