//
//  ArrayExtensions.swift
//  swifty-tictactoe
//
//  Created by Alexandre Henrique on 3/9/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import Foundation

extension Array where Element : Equatable {
    
    func contained(elements: [Element]) -> [Element] {
        
        var containedElements = [Element]()
        
        elements.forEach {
            if self.contains($0) {
                containedElements.append($0)
            }
        }
        
        return containedElements
    }
    
}
