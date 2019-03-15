//
//  UIImageExtension.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 12/03/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

extension UIImage {
    
    struct assets {
        static let cross  = UIImage(named: "cross"),
                   circle = UIImage(named: "circle")
    }
    
}

extension Optional where Wrapped: UIImage {
    
    func editable() -> UIImage {
        guard let image = self else { return UIImage() }
        return image.withRenderingMode(.alwaysTemplate)
    }
    
}
