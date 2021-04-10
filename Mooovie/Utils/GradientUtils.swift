//
//  GradientUtils.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 10/04/21.
//

import UIKit

class GradientUtils {
    
    static func addVertical(to view: UIView, frame: CGRect? = nil, startColor: UIColor, endColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        gradient.name = "gradient"
        gradient.zPosition = -1
        gradient.cornerRadius = view.layer.cornerRadius
        gradient.masksToBounds = view.layer.masksToBounds
        
        gradient.frame = frame ?? view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}
