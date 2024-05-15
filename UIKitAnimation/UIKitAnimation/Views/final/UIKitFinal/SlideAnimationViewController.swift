//
//  SlideAnimationViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 14/05/24.
//

import UIKit
import SwiftUI

class SlideAnimationViewController: UIViewController {
    
    var circleWidthAnchor: NSLayoutConstraint!
    var circleHeightAnchor: NSLayoutConstraint!
    let slider: UISlider = {
        var slider: UISlider = .init()
        slider.value = 0.5
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let circle: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(slider)
        view.addSubview(circle)
        
        slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        setupConstraint()
    }
    
    @objc func didChangeSlider() {
        circleWidthAnchor.constant = CGFloat(100 * slider.value)
        circleHeightAnchor.constant = CGFloat(100 * slider.value)
        
        UIView.animate(withDuration: 0) {
            self.circle.layer.cornerRadius = CGFloat((100 * self.slider.value) / 2)
            self.circle.layoutIfNeeded()
        }
    }
    
    func setupConstraint() {
        
        circleWidthAnchor = circle.widthAnchor.constraint(equalToConstant: 50)
        circleHeightAnchor = circle.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.bottomAnchor.constraint(equalTo: circle.centerYAnchor, constant: -75)
        ])
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleWidthAnchor,
            circleHeightAnchor,
        ])
        
        circle.layer.cornerRadius = 25
    }
}

#Preview {
    ViewControllerToPreview { SlideAnimationViewController.self }
}
