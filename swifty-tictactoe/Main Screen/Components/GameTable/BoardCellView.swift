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
    
    var imageView = UIImageView() {
        didSet { self.setImageLayout() }
    }
    
    weak var delegate: BoardCellDelegate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidPressed))
            tap.numberOfTapsRequired = 1
            tap.delegate             = self
        
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImageLayout() {
        
        imageView.frame = CGRect(x: self.frame.midX,
                                 y: self.frame.midY,
                                 width: self.frame.width/2,
                                 height: self.frame.height/2)
        
        self.addSubview(imageView)
        
        imageView.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding: UIEdgeInsets(top: self.frame.height/4,
                                               left: self.frame.width/4,
                                               bottom: self.frame.height/4,
                                               right: self.frame.width/4))
    }
    
    @objc func viewDidPressed(touch: UITapGestureRecognizer) {
        
        if self.imageView.isDescendant(of: self) { return }
        
        guard let playerData     = self.delegate?.getPlayerData() else { return }
        guard let isBoardUpdated = self.delegate?.updateBoard(squareId: self.id, player: .player) else { return }
        
        if isBoardUpdated {
            imageView = UIImageView(image: playerData.1.withRenderingMode(.alwaysTemplate))
        }
        
        self.delegate?.checkGameStatus(player: .player)
        
        self.delegate?.computerTurn()
    }
    
}
