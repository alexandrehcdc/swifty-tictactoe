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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        loadElements()
    }
    
    func loadElements() {
        
        let viewAxisSize = self.view.frame.width - 32

        let board = MainBoardView(frame: CGRect(x: self.view.frame.minX,
                                                y: self.view.frame.minY,
                                                width: viewAxisSize,
                                                height: viewAxisSize))
        
        self.screenTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        self.screenTitle?.text = "Swifty Tic Tac Toe"
        self.screenTitle?.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.screenTitle?.textAlignment = .center
        self.screenTitle?.minimumScaleFactor = 0.5
        self.screenTitle?.adjustsFontSizeToFitWidth = true
        
        self.view.addSubview(board)
//        self.view.addSubview(self.screenTitle!)
        
        board.anchor(top: nil,
                     leading: self.view.leadingAnchor,
                     bottom: nil,
                     trailing: self.view.trailingAnchor,
                     padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                     size: CGSize(width: board.frame.width, height: board.frame.height))
//
        board.anchorCenterY(anchorY: self.view.centerYAnchor)
        
        
        
    }

}
