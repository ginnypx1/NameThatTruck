//
//  SettingsViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/30/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var toggleSoundButton: UIButton!
    @IBOutlet weak var togglePhotosButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var soundManager: SoundManager!
    
    var photoFeatureMuted: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // add outline to title font
        titleLabel.attributedText = GameDesign.setTitleLabelFont()

        // check sound preferences
        soundManager.checkSoundPreferences(button: self.toggleSoundButton)
        // check photo preferences
        checkPhotoPreferences(button: self.togglePhotosButton)
    }
    
    // MARK: - Toggle Sound Preferences
    
    @IBAction func toggleSoundPreferences(_ sender: Any) {
        // turn sound on or off in user defaults
        soundManager.toggleSoundOnOrOff(button: self.toggleSoundButton)
        // change the button image to reflect preference
        soundManager.toggleSoundButtonImage(button: self.toggleSoundButton)
    }
    
    // MARK: - Toggle Photo Preferences
    
    func checkPhotoPreferences(button: UIButton) {
        // check to see if photos feature is on or off, set photoFeatureMuted to that variable
        photoFeatureMuted = UserDefaults.standard.bool(forKey: "photoFeatureMuted")
        print("Photo Feature is Muted: \(self.photoFeatureMuted)")
        togglePhotoButtonImage()
    }
    
    func togglePhotoFeatureOnOrOff() {
        if photoFeatureMuted {
            // change it to allow photos
            photoFeatureMuted = false
            UserDefaults.standard.set(false, forKey: "photoFeatureMuted")
            UserDefaults.standard.synchronize()
            togglePhotoButtonImage()
        } else {
            // photos phot feature will be turned off
            photoFeatureMuted = true
            UserDefaults.standard.set(true, forKey: "photoFeatureMuted")
            UserDefaults.standard.synchronize()
            togglePhotoButtonImage()
        }
    }
    
    func togglePhotoButtonImage() {
        // change the image of the photos button according to feature preference
        if photoFeatureMuted {
            // change image to photosOff
            let photosOffImage = UIImage(named: "photos-off")
            self.togglePhotosButton.setImage(photosOffImage, for: .normal)
        } else {
            // change image to photos-on
            let photosOnImage = UIImage(named: "photos-on")
            self.togglePhotosButton.setImage(photosOnImage, for: .normal)
        }
    }

    
    @IBAction func togglePhotoPreferences(_ sender: Any) {
        // turn photo feature on or off
        togglePhotoFeatureOnOrOff()
        // change button image to reflect preferences
        togglePhotoButtonImage()
    }
    
    // MARK: - Return to Main Menu

    @IBAction func returnToMainMenu(_ sender: Any) {
        // return to the main menu view controller
        self.dismiss(animated: true, completion: nil)
    }

}
