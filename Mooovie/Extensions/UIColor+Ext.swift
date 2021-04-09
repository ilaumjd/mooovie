//
//  UIColor+Ext.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

extension UIColor {
    
    @nonobjc class var pureWhite: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @nonobjc class var lemonMeringue: UIColor {
        return UIColor(named: "LemonMeringue") ?? .pureWhite
    }
    
    @nonobjc class var maximumRed: UIColor {
        return UIColor(named: "MaximumRed") ?? .pureWhite
    }
    
    @nonobjc class var maximumYellow: UIColor {
        return UIColor(named: "MaximumYellow") ?? .pureWhite
    }
    
    @nonobjc class var orange: UIColor {
        return UIColor(named: "Orange") ?? .pureWhite
    }
    
    @nonobjc class var prussianBlue: UIColor {
        return UIColor(named: "PrussianBlue") ?? .pureWhite
    }
    
}
