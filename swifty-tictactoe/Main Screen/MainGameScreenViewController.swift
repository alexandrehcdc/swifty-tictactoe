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
        flowLayout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        flowLayout.scrollDirection = .horizontal

        let board = BoardCollectionView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: flowLayout)
        
        self.view.addSubview(board)
        
        board.fillSuperView()
        
    }

}
