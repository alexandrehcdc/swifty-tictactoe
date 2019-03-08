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
    
    var winningSequences = [[0,1,2], [3,4,5],
                            [6,7,8], [0,3,6],
                            [1,4,7], [2,5,8],
                            [0,4,8], [6,4,2]]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        loadElements()
    }
    
    func loadElements() {
        
        let viewAxisSize = self.view.frame.width - 32

        let board = MainBoardView(frame: CGRect(x: self.view.frame.minX,
                                                y: self.view.frame.minY,
                                                width: viewAxisSize,
                                                height: viewAxisSize))
        
        board.computerPickedImage = UIImage(named: "cross")
        board.playerPickedImage   = UIImage(named: "circle")
        
        self.view.addSubview(board)
        
        board.anchor(top: nil,
                     leading: self.view.leadingAnchor,
                     bottom: nil,
                     trailing: self.view.trailingAnchor,
                     padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                     size: CGSize(width: board.frame.width, height: board.frame.height))

        board.anchorCenterY(anchorY: self.view.centerYAnchor)
        
    }

}
