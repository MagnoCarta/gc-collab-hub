//
//  SimpleAnimationSlideViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 26/06/24.
//

import SwiftUI
import UIKit

class SimpleAnimationSlideViewController: UIViewController {
    
    let animatedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var isAnimated = false
    var widthConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animatedView)
        
        widthConstraint = animatedView.widthAnchor.constraint(equalToConstant: 50)
        heightConstraint = animatedView.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            animatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            widthConstraint,
            heightConstraint
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        animatedView.addGestureRecognizer(tapGesture)
        animatedView.isUserInteractionEnabled = true
        
    }
    
    @objc func handleTapGesture() {
        isAnimated.toggle()
        
        widthConstraint.constant = isAnimated ? 100 : 50
        heightConstraint.constant = isAnimated ? 100 : 50
        
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

#Preview {
    ViewControllerToPreview { SimpleAnimationSlideViewController.self }
}
