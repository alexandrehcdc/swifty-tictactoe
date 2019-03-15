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
        
        guard let playerPickedImage = self.playerPickedImage else {
            return (.player, UIImage())
        }

        return (.player, playerPickedImage)
    
    }
    
    func checkWinner(player: PlayerTypeEnum) -> Bool {
        
        let indices = self.board.indices.filter { self.board[$0].1 == player }
        
        for possibility in winningSequences {
            
            let containedElements = indices.contained(elements: possibility)
            
            if indices.count > 2 && containedElements.count > 2 {
                possibility.forEach {
                    self.board[$0].0.imageView.tintColor = UIColor.green
                }
                
                gameOver()
                
                return true
            }
            
        }
        
        if freeSpotsAmount() == 0 {
            gameOver()
        }
        return false
        
    }
    
    private func gameOver(isGameTied: Bool = false) {
        self.blockView(with: self.blockageView)
    }
    
    func computerTurn() {

        let everyFreeSpot = freeSpots()
        
        guard let nextPos = everyFreeSpot.first else { return }
        
        let boardUpdated = self.updateBoard(squareId: nextPos.0.id, player: .computer)
        
        if boardUpdated {
            nextPos.0.imageView = UIImageView(image: UIImage(named: "cross").editable())
        }
        
        if self.checkWinner(player: .computer) { /* to do*/ }

    }
    
    func minimax(board: [(BoardCellView, PlayerTypeEnum)]) {
        let availableSpots = freeSpots()
        
        
        
    }
    
}

extension MainBoardView {
    private func freeSpots() -> [(BoardCellView, PlayerTypeEnum)] {
        return self.board.filter { $0.1 == .none }
    }
    
    private func freeSpotsAmount() -> Int {
        return self.board.reduce(0) { $1.1 == .none ? $0 + 1 : $0 }
    }
}
