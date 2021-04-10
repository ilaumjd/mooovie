//
//  UIView+Ext.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 09/04/21.
//

import UIKit

extension UIView {
    
    static func horizontalSeparator() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.prussianBlue.withAlphaComponent(0.5)
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }
    
}
