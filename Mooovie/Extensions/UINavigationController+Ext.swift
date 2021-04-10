//
//  UINavigationController+Ext.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

extension UINavigationController {
    
    func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.pureWhite, .font: UIFont.rounded(ofSize: 40, weight: .bold)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.pureWhite, .font: UIFont.rounded(ofSize: 25, weight: .semibold)]
        navBarAppearance.backgroundColor = .maximumRed
        
        self.navigationBar.standardAppearance = navBarAppearance
        self.navigationBar.compactAppearance = navBarAppearance
        self.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = .white
        
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
}
