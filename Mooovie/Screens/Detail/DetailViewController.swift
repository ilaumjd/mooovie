//
//  DetailViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    static func create(movieId: Int?) -> DetailViewController {
        let vc = DetailViewController()
        return vc
    }
    
}

// MARK: LIFECYCLE
extension DetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}
