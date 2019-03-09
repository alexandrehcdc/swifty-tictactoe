//
//  BoardCellView.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/7/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class BoardCellView: UIView, UIGestureRecognizerDelegate {
    
    var id = 0
    
    weak var delegate: BoardCellDelegate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidPressed))
        tap.numberOfTapsRequired = 1
        tap.delegate = self
        
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func viewDidPressed(touch: UITapGestureRecognizer) {
        
        guard let isBoardUpdated = self.delegate?.updateBoard(squareId: self.id, player: .computer) else { return }
        
        if isBoardUpdated {
            
            guard let playerData = self.delegate?.getPlayerData() else { return }
                  let imageView  = UIImageView(image: playerData.1)
            
            self.addSubview(imageView)
            
            imageView.fillSuperView()
            
        }
        
    }
    
}
