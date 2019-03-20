//
//  BoardCommonButton.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/19/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class BoardCommonButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyling() {
        self.backgroundColor = UIColor.blue
        self.titleLabel?.textColor = UIColor.white
        self.layer.cornerRadius = 4
    }
    
    func setBehavior(title: String, action: () -> ()) {
        self.titleLabel?.text = title
//        self.addTarget(self, action: #selector(), for: .touchUpInside)
    }
    
}
