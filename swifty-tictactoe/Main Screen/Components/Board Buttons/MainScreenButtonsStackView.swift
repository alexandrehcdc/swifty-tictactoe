//
//  MainScreenButtonsStackView.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 2/27/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class MainScreenButtonsStackView: UIStackView {
    
    private var restartGameButton, showScore : BoardCommonButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.restartGameButton = BoardCommonButton()
        self.showScore         = BoardCommonButton()
        
        self.backgroundColor = UIColor.blue
        
        guard let restartBtn = self.restartGameButton, let scoreBtn = self.showScore else { return }
        
        self.addArrangedSubview(restartBtn)
        self.addArrangedSubview(scoreBtn)
        
        restartBtn.fillSuperView()
        scoreBtn.fillSuperView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.restartGameButton = nil
        self.showScore         = nil
    }
    
}
