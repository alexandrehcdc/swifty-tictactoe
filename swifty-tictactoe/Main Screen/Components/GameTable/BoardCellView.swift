//
//  BoardCellView.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/7/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class BoardCellView: UIView, UIGestureRecognizerDelegate {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidPressed))
            tap.numberOfTapsRequired = 1
            tap.delegate = self
        
        self.backgroundColor = UIColor.white
        
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func viewDidPressed(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: self)
        
        print("x \(touchPoint.x) and y \(touchPoint.y)")
    }
    
}
