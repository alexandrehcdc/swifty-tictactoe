//
//  MainBoardDelegate.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/9/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import Foundation

protocol MainBoardDelegate: class {
    func endGame()
    func restartGame()
}
