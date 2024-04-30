//
//  NaavigationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit

class NavigationViewController: UINavigationController {
    init(view: UIViewController) {
        super.init(rootViewController: view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
