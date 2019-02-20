//
//  BoardCollectionView.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 20/02/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

class BoardCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        self.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: BoardCollectionViewCell.description())
        self.backgroundColor = UIColor.yellow
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: BoardCollectionViewCell.description(), for: indexPath)
        
        cell.frame.size = CGSize(width: 50, height: 50)
        return cell
    }

}
