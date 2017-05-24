//
//  CreditsViewController.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/23/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

/* All images are public domain found at pixabay or wikimedia */
// Gif images are from creative commons licensed videos on YouTube

class CreditsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    let credits = Credits()
    
    var photoCredits: [String]!
    var videoCredits: [String]!
    
    var sections: [Section]!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set tableView delegate and dataSource
        tableView.delegate = self
        tableView.dataSource = self
        // set tableView to size dynamically
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        // create table sections
        createTableSections()
        // add outline to title font
        titleLabel.attributedText = GameDesign.setTitleLabelFont()
    }
    
    // MARK: - Create Table Sections
    
    func createTableSections() {
        // grab photo and video credits
        photoCredits = credits.allPhotoCredits
        videoCredits = credits.generateAllVideoCredits()
        // make two sections
        let photoSection = Section(title: "Photo Credits", objects: self.photoCredits)
        let videoSection = Section(title: "Video Credits", objects: self.videoCredits)
        sections = [photoSection, videoSection]
    }
    
    // MARK: - Table View Header
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // give the header a title
        return sections[section].heading
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // return proper section number for credits
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return number of credits in each section
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // fill each cell with credits
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreditViewCell", for: indexPath) as! CreditViewCell
        cell.creditLabel.font = UIFont(name: "Avenir", size: 12);
        cell.creditLabel.text = sections[indexPath.section].items[indexPath.row]
        return cell
    }
    
    // MARK: - Navigation
    
    @IBAction func returnToMainMenu(_ sender: Any) {
        // return to the main menu view controller
        self.navigationController?.popViewController(animated: true)
    }
}
