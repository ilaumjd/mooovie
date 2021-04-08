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
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.rounded(ofSize: 40, weight: .bold)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.rounded(ofSize: 25, weight: .semibold)]
        navBarAppearance.backgroundColor = .red
        
        self.navigationBar.standardAppearance = navBarAppearance
        self.navigationBar.compactAppearance = navBarAppearance
        self.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = .white
    }
    
}
