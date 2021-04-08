//
//  UIImageView+Ext.swift
//  ios-kampus
//
//  Created by aku pintar indonesia on 14/03/20.
//  Copyright © 2020 aku pintar indonesia. All rights reserved.
//

import Alamofire
import AlamofireImage

extension UIImageView {
    
    func from(_ url: String) {
        AF.request(url).responseImage { response in
            debugPrint(response.result)
            if case .success(let image) = response.result {
                self.image = image
            }
        }
    }
    
}
