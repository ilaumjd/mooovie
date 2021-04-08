//
//  ListViewController.swift
//  Mooovie
//
//  Created by aku pintar indonesia on 08/04/21.
//

import UIKit

class ListViewController: UIViewController {
    
    private let vm = ListViewModel(service: MovieService())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Mooovie"
        self.view.backgroundColor = .white
        
        self.vm.fetchList()
    }


}

