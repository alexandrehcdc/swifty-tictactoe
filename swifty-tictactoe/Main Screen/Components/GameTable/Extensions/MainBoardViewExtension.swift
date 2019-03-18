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
    
    func checkWinner(player: PlayerTypeEnum) -> (PlayerTypeEnum, Bool) {
        
        let indices = self.board.indices.filter { self.board[$0].1 == player }
        
        for possibility in winningSequences {
            
            let containedElements = indices.contained(elements: possibility)
            
            if indices.count > 2 && containedElements.count > 2 {
                for index in possibility {
                    self.board[index].0.imageView.tintColor = UIColor.green
                }
                
                gameOver(player: (player, true))
                
                return (player, true)
            }
            
        }
        
        if freeSpotsAmount() == 0 {
            gameOver(player: (.none,true))
            return (.none, true)
        }
        return (.none, false)
        
    }
    
    func gameOver(player: (PlayerTypeEnum, Bool)) {
        let playerType = player.0
        let status     = player.1
        
        if status {
            self.blockView(with: self.blockageView)
        }
    }
    
    func computerTurn() {
        guard let nextPos = freeSpots().first else { return }
        
        let boardUpdated = self.updateBoard(squareId: nextPos.0.id, player: .computer)

        if boardUpdated {
            nextPos.0.imageView = UIImageView(image: UIImage(named: "cross").editable)
        }
        
        let gameStatus = self.checkWinner(player: .computer)
        
        self.gameOver(player: gameStatus)
    }
    
    func minimax(board: [(BoardCellView, PlayerTypeEnum)], player: PlayerTypeEnum) -> Int {
        let availableSpots = freeSpots()
        var moves          = [BoardStruct]()
        var bestMove: Int?
        
        if checkWinner(player: .player).1 {
            return -1
        } else if checkWinner(player: .computer).1 {
            return 1
        } else if availableSpots.isEmpty {
            return 0
        }
        
        for (index, _) in availableSpots.enumerated() {
            var move = BoardStruct(index: 0, score: 0)
//            board[availableSpots[index].0.id].1 = player
            
            if player == .computer {
                move = BoardStruct(index: index, score: minimax(board: board, player: .player))
            } else {
                move = BoardStruct(index: index, score: minimax(board: board, player: .computer))
            }
            
            moves.append(move)
            
        }
        
        bestMove = moves.first?.index
        
        if player == .computer {
            for index in 0...moves.count {
                guard let move = bestMove else { return 1000 }
                if moves[index].score > move {
                    bestMove = index
                }
            }
        } else {
            
        }
        
        return 0
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
