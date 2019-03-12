//
//  MainGameScreenViewController.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 20/02/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class MainGameScreenViewController: UIViewController {
    
    var screenTitle: UILabel?
    
    var gameBoard = MainBoardView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        loadElements()
    }
    
    func loadElements() {
        
        let viewAxisSize = self.view.frame.width - 32

        self.gameBoard = MainBoardView(frame: CGRect(x: self.view.frame.minX,
                                                     y: self.view.frame.minY,
                                                     width: viewAxisSize,
                                                     height: viewAxisSize))
        
        self.gameBoard.delegate            = self
        self.gameBoard.computerPickedImage = UIImage.assets.cross
        self.gameBoard.playerPickedImage   = UIImage.assets.circle
        
        self.view.addSubview(self.gameBoard)
        
        self.gameBoard.anchor(top: nil,
                     leading: self.view.leadingAnchor,
                     bottom: nil,
                     trailing: self.view.trailingAnchor,
                     padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                     size: CGSize(width: self.gameBoard.frame.width, height: self.gameBoard.frame.height))

        self.gameBoard.anchorCenterY(anchorY: self.view.centerYAnchor)
        
    }

}

extension MainGameScreenViewController: MainBoardDelegate {
    
    func endGame() {
        self.gameBoard.removeFromSuperview()
    }
    
    func restartGame() {
        self.endGame()
        self.loadElements()
    }
    
}
