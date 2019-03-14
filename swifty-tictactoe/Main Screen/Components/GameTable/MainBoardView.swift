//
//  MainBoardView.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/6/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class MainBoardView: UIView {
    
    weak var delegate: MainBoardDelegate?
    
    var viewPositions = [(CGFloat, CGFloat)]()
    var board         = [(BoardCellView, PlayerTypeEnum)]()
    
    var currentPlayer: PlayerTypeEnum = .player
    var playerPickedImage: UIImage?
    var computerPickedImage: UIImage?
    
    let blockageView     = UIView()
    let winningSequences = [[0,1,2], [3,4,5],
                            [6,7,8], [0,3,6],
                            [1,4,7], [2,5,8],
                            [0,4,8], [6,4,2]]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3
        self.backgroundColor   = UIColor.black
        
        setSubviewsPositions()
        startGame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setSubviewsPositions() {
        viewPositions.append((self.frame.minX, self.frame.minY))
        viewPositions.append((self.frame.minX, self.frame.maxY/3))
        viewPositions.append((self.frame.minX, (self.frame.maxY/3)*2))
        
        viewPositions.append((self.frame.maxX/3, self.frame.minY))
        viewPositions.append((self.frame.maxX/3, self.frame.maxY/3))
        viewPositions.append((self.frame.maxX/3, (self.frame.maxY/3)*2))
        
        viewPositions.append(((self.frame.maxX/3)*2, self.frame.minY))
        viewPositions.append(((self.frame.maxX/3)*2, self.frame.maxY/3))
        viewPositions.append(((self.frame.maxX/3)*2, (self.frame.maxY/3)*2))
    }
    
    func startGame() {
        
        for (index, element) in self.viewPositions.enumerated() {
            
            let newView = BoardCellView(frame: CGRect(x: element.0,
                                                      y: element.1,
                                                      width: (self.frame.width/3)-2,
                                                      height: (self.frame.height/3)-2))
            
            newView.delegate = self
            newView.id = index
            
            self.addSubview(newView)
            self.board.append((newView, PlayerTypeEnum.none))
        }
        
    }
    
}
