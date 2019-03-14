//
//  UIViewExtension.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/14/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

extension UIView {
    
    func blockView(with usedView: UIView) {
        
        self.addSubview(usedView)
        
        usedView.fillSuperView()
    }
    
    func releaseView(with usedView: UIView) {
        usedView.removeFromSuperview()
    }
    
}
