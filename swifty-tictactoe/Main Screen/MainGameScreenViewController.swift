//
//  MainGameScreenViewController.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 20/02/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class MainGameScreenViewController: UIViewController {
    
    var screenTitle: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        loadElements()
    }
    
    func loadElements() {
        
        let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 5
            flowLayout.minimumLineSpacing = 5

        let board = BoardCollectionView(frame: CGRect(x: self.view.frame.minX,
                                                      y: self.view.frame.minY + 16,
                                                      width: 160,
                                                      height: 170),
                                        collectionViewLayout: flowLayout)
        
        self.screenTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        self.screenTitle?.text = "Swifty Tic Tac Toe"
        
        self.view.addSubview(board)
        self.view.addSubview(self.screenTitle!)
        
        board.anchor(top: self.view.topAnchor,
                     leading: self.view.leadingAnchor,
                     bottom: self.view.bottomAnchor,
                     trailing: self.view.trailingAnchor,
                     padding: UIEdgeInsets(top: 96, left: 16, bottom: 16, right: 16),
                     size: CGSize(width: board.frame.width, height: board.frame.height))
        
        
        
    }

}
