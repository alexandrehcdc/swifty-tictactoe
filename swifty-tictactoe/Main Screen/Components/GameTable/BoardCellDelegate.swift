//
//  BoardCellDelegate.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 08/03/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

protocol BoardCellDelegate: class {
    func updateBoard(squareId: Int, player: PlayerTypeEnum) -> Bool
    func getPlayerData() -> (PlayerTypeEnum, UIImage)
    func checkWinner(player: PlayerTypeEnum) -> (PlayerTypeEnum, Bool)
    func gameOver(player: (PlayerTypeEnum, Bool))
    func computerTurn()
}
