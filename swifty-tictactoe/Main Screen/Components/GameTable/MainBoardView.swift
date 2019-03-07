//
//  MainBoardView.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/6/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class MainBoardView: UIView {
    
    var path = UIBezierPath()
    var viewPositions = [(CGFloat, CGFloat)]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 3
        
        
        setSubviewsPositions()
        createViews()
    }
    
    override var safeAreaLayoutGuide: UILayoutGuide {
        return UILayoutGuide()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubviewsPositions() {
        viewPositions.append((self.frame.minX, self.frame.maxY))
        viewPositions.append((self.frame.minX, (self.frame.maxY/3)*2))
        viewPositions.append((self.frame.minX, self.frame.maxY/3))
        
        viewPositions.append((self.frame.maxX/3, self.frame.maxY))
        viewPositions.append((self.frame.maxX/3, (self.frame.maxY/3)*2))
        viewPositions.append((self.frame.maxX/3, self.frame.maxY/3))
        
        viewPositions.append(((self.frame.maxX/3)*2, self.frame.maxY))
        viewPositions.append(((self.frame.maxX/3)*2, (self.frame.maxY/3)*2))
        viewPositions.append(((self.frame.maxX/3)*2, self.frame.maxY/3))
    }
    
    func createViews() {
        for (x,y) in self.viewPositions {
            let newView = BoardCellView(frame: CGRect(x: x, y: y, width: 50, height: 50))
            self.addSubview(newView)
        }
    }
    
}
