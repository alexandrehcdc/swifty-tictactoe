//
//  UIImageExtension.swift
//  swifty-tictactoe
//
//  Created by Alexandre on 12/03/19.
//  Copyright © 2019 Alexandre. All rights reserved.
//

import UIKit

extension UIImage {
    var editable: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
    
    struct assets {
        static let cross  = UIImage(named: "cross"),
                   circle = UIImage(named: "circle")
    }
    
}

extension Optional where Wrapped: UIImage {
    var editable: UIImage {
        return self?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }
}
