//
//  BoardCollectionViewCell.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 20/02/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class BoardCollectionViewCell: UICollectionViewCell {
    
    var selectedStateImage: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
    }
    
    override func didMoveToSuperview() {
        self.selectedStateImage = UIImageView(image: UIImage(named: "circle"), highlightedImage: nil)
        
        self.addSubview(selectedStateImage!)
        
        self.selectedStateImage?.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
