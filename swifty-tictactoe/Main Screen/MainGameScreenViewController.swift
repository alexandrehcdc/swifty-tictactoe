//
//  MainGameScreenViewController.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 20/02/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class MainGameScreenViewController: UIViewController {

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
        
        self.view.addSubview(board)
        
//        board.fillSuperView()
        
    }

}
