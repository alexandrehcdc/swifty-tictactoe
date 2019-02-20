//
//  BoardCollectionViewCell.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 20/02/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class BoardCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
