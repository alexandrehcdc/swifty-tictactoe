//
//  MainBoardViewExtension.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/14/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

extension MainBoardView: BoardCellDelegate {
    
    func updateBoard(squareId: Int, player: PlayerTypeEnum) -> Bool {
        if self.board[squareId].1 == .none {
            self.board[squareId].1 = player
            return true
        }
        return false
    }
    
    func getPlayerData() -> (PlayerTypeEnum, UIImage) {
        
        guard let aiPickedImage     = self.computerPickedImage,
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
        
        let indices = self.board.indices.filter { self.board[$0].1 == player }
        
        for possibility in winningSequences {
            
            let containedElements = indices.contained(elements: possibility)
            
            if indices.count > 2 && containedElements.count > 2 {
                
                possibility.forEach {
                    self.board[$0].0.imageView.tintColor = UIColor.green
                }
                
                self.blockView(with: self.blockageView)
                
                break
            }
            
        }
        
        let placesLeftToPlay = self.board.reduce(0) { $1.1 == .none ? $0 + 1 : $0 }
        
        if placesLeftToPlay == 0 {
            gameOver()
        } else {
            aiTurn()
        }
        
    }
    
    func gameOver() {
        
        self.blockView(with: self.blockageView)
        
    }
    
    func aiTurn() {
        
        self.blockView(with: self.blockageView)
        
        self.currentPlayer = .computer
        
        let freePos = self.board.filter { $0.1 == .none }
        
        guard let nextPos = freePos.first else { return }
        
        let boardUpdated = self.updateBoard(squareId: nextPos.0.id, player: nextPos.1)
        
        if boardUpdated {
            nextPos.0.imageView = UIImageView(image: UIImage(named: "cross")!.withRenderingMode(.alwaysTemplate))
        }
        
    }
    
}
