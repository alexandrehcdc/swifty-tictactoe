//
//  MainBoardView.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/6/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class MainBoardView: UIView {
    
    var viewPositions = [(CGFloat, CGFloat)]()
    var board = [PlayerTypeEnum]()
    
    var player: PlayerTypeEnum = .none
    var playerPickedImage: UIImage?
    var computerPickedImage: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3
        self.backgroundColor = UIColor.black
        
        setSubviewsPositions()
        startGame()
    }
    
    override var safeAreaLayoutGuide: UILayoutGuide {
        return UILayoutGuide()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            self.board.append(PlayerTypeEnum.none)
        }
    }
    
}

extension MainBoardView: BoardCellDelegate {
    
    func updateBoard(squareId: Int, player: PlayerTypeEnum) {
        self.board[squareId] = player
    }
    
    func getPlayerData() -> (PlayerTypeEnum, UIImage) {
        
        guard let aiPickedImage = self.computerPickedImage,
              let playerPickedImage = self.playerPickedImage else {
            return (self.player, UIImage())
        }
        
        switch self.player {
            case .computer:
                return (self.player, aiPickedImage)
            case .player:
                return (self.player, playerPickedImage)
            default:
                return (self.player, UIImage())
        }

    }
    
}
