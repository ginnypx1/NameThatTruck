//
//  GameDesign.swift
//  NameThatTruck
//
//  Created by Ginny Pennekamp on 5/19/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

struct GameDesign {
    
    // game colors
    static let roadSignRed = UIColor(red: 192/255, green: 0, blue: 0, alpha: 1)
    static let constructionOrange = UIColor(red: 254/255, green: 184/255, blue: 47/255, alpha: 1)
    static let constructionYellow = UIColor(red: 247/255, green: 212/255, blue: 23/255, alpha: 1)
    static let roadSignGreen = UIColor(red: 0, green: 153/255, blue: 0, alpha: 1)
    static let roadSignBlue = UIColor(red: 0, green: 0, blue: 254/255, alpha: 1)
    
    static func setTitleLabelFont() -> NSMutableAttributedString {
        // adds an outline to the title label font
        let mutableString = NSMutableAttributedString(string: "NAME THAT TRUCK", attributes: [
            NSStrokeColorAttributeName: UIColor.black,
            NSForegroundColorAttributeName: GameDesign.constructionOrange,
            NSStrokeWidthAttributeName: -2.0])
        return mutableString
    }
    
    static func changeSignForGame(forGameType gameType: GameType, bottomSignView: UIView, topSignView: UIView, winningTruckLabel: UILabel, canYouFindLabel: UILabel) {
        // change the sign coloring to match the game type
        switch gameType {
        case .Construction:
            bottomSignView.backgroundColor = GameDesign.constructionOrange
            topSignView.backgroundColor = GameDesign.constructionOrange
            topSignView.layer.borderColor = UIColor.black.cgColor
            winningTruckLabel.backgroundColor = UIColor.black
            winningTruckLabel.textColor = GameDesign.constructionYellow
            canYouFindLabel.textColor = UIColor.white
        case .Emergency:
            bottomSignView.backgroundColor = UIColor.white
            topSignView.backgroundColor = UIColor.white
            topSignView.layer.borderColor = UIColor.black.cgColor
            winningTruckLabel.backgroundColor = UIColor.black
            winningTruckLabel.textColor = GameDesign.roadSignRed
            canYouFindLabel.textColor = UIColor.black
        case .City:
            bottomSignView.backgroundColor = GameDesign.roadSignGreen
            topSignView.backgroundColor = GameDesign.roadSignGreen
            topSignView.layer.borderColor = UIColor.white.cgColor
            winningTruckLabel.backgroundColor = UIColor.white
            winningTruckLabel.textColor = GameDesign.constructionYellow
            canYouFindLabel.textColor = UIColor.white
        case .All:
            bottomSignView.backgroundColor = GameDesign.roadSignBlue
            topSignView.backgroundColor = GameDesign.roadSignBlue
            topSignView.layer.borderColor = UIColor.white.cgColor
            winningTruckLabel.backgroundColor = UIColor.white
            winningTruckLabel.textColor = GameDesign.constructionOrange
            canYouFindLabel.textColor = UIColor.white
        }
    }

}
