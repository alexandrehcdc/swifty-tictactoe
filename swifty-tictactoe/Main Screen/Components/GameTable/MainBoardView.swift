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
         var drawer:   UIBezierPath?
    
    var viewPositions = [(CGFloat, CGFloat)]()
    var board         = [PlayerTypeEnum]()
    
    var currentPlayer: PlayerTypeEnum = .player
    var playerPickedImage: UIImage?
    var computerPickedImage: UIImage?
    
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
    
    override func draw(_ rect: CGRect) {
        
        self.drawer = UIBezierPath()
        self.drawer?.move(to: CGPoint(x: 10, y: 10))
        self.drawer?.addLine(to: CGPoint(x: 30, y: 30))
        self.drawer?.addLine(to: CGPoint(x: 50, y: 50))
        
        self.drawer?.close()
        
        UIColor.orange.setFill()
        self.drawer?.fill()
        
        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        self.drawer?.stroke()
        
//
//        self.drawer?.drawLineBy(points: [CGPoint(x: (self.superview?.frame.minX)!, y: (self.superview?.frame.maxY)!), CGPoint(x: (self.superview?.frame.midX)!, y: (self.superview?.frame.midY)!)])
//
//        self.drawer?.close()
        
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
            self.board.append(PlayerTypeEnum.none)
            
        }
        
    }
    
}

extension MainBoardView: BoardCellDelegate {
    
    func updateBoard(squareId: Int, player: PlayerTypeEnum) -> Bool {
        if self.board[squareId] == .none {
            self.board[squareId] = player
            return true
        }
        return false
    }
    
    func getPlayerData() -> (PlayerTypeEnum, UIImage) {
        
        guard let aiPickedImage = self.computerPickedImage,
              let playerPickedImage = self.playerPickedImage else {
            return (self.currentPlayer, UIImage())
        }
        
        switch self.currentPlayer {
            case .computer:
                let player = self.currentPlayer
                self.currentPlayer = .player
                return (player, aiPickedImage)
            case .player:
                let player = self.currentPlayer
                self.currentPlayer = .computer
                return (player, playerPickedImage)
            default:
                return (self.currentPlayer, UIImage())
        }

    }
    
    func checkGameStatus(player: PlayerTypeEnum) {
        
        let indices = self.board.indices.filter { self.board[$0] == player }
        
        for possibility in winningSequences {
            
            let containedElements = indices.contained(elements: possibility)
            
            if indices.count > 2 && containedElements.count > 2 {
                self.delegate?.restartGame()
                break
            }
            
        }
        
    }
    
}
