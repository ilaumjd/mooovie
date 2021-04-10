//
//  MooovieSeparator.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 09/04/21.
//

import UIKit

class MooovieSeparator: UIView {
    
    let line = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        line.backgroundColor = UIColor.prussianBlue.withAlphaComponent(0.5)
        self.addSubview(line)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHorizontal(height: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: 1).isActive = true
        line.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: height).isActive = true
        line.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        line.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
