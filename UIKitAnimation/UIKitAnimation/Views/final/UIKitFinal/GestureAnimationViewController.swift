//
//  GestureAnimationViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 14/06/24.
//

import UIKit
import SwiftUI

class GestureAnimationViewController: UIViewController {
    
    var circleWidthAnchor: NSLayoutConstraint!
    var circleHeightAnchor: NSLayoutConstraint!
    
    let circle: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(circle)
        setupConstraint()
        
    }
    
    func setupConstraint() {
        circleWidthAnchor = circle.widthAnchor.constraint(equalToConstant: 50)
        circleHeightAnchor = circle.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleWidthAnchor,
            circleHeightAnchor,
        ])
    }
    
}

#Preview {
    ViewControllerToPreview {GestureAnimationViewController.self}
}
