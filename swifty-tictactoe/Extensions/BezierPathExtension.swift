//
//  BezierPathExtension.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/9/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

extension UIBezierPath {
    
    func drawLineBy(points: [CGPoint], color: UIColor = UIColor.red) -> UIBezierPath {
        guard let firstPoint   = points.first else { return UIBezierPath() }
        let pointsToDraw = Array(points.dropFirst())
        
        self.move(to: firstPoint)
        
        for point in pointsToDraw {
            self.addLine(to: point)
        }
        
        color.setFill()
        self.fill()
        self.close()
        
        return self
    }
    
}
