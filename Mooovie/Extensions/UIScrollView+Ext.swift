//
//  UIScrollView+Ext.swift
//  ios-kampus
//
//  Created by aku pintar indonesia on 28/05/20.
//  Copyright © 2020 aku pintar indonesia. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func update(contentView: UIView, height: CGFloat) {
        var newSize = self.frame.size
        newSize.height = height
        self.contentSize = newSize
        contentView.frame.size = newSize
    }
    
}
