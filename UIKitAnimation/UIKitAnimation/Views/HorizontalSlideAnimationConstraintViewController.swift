//
//  HorizontalSlideAnimationConstraintViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 10/05/24.
//

import UIKit
import SwiftUI

class HorizontalSlideAnimationConstraintViewController: UIViewController {
    var leadingConstraint: NSLayoutConstraint!
    var centerConstraintText: NSLayoutConstraint!
    var isShowingDetails: Bool = false
    
    let animatedView: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let showDetailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mostrar Detalhes", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animatedView)
        view.addSubview(showDetailButton)
        
        showDetailButton.addTarget(self, action: #selector(didTapShowDetail), for: .touchUpInside)
        
        setupConstraints()
    }
    
    @objc func didTapShowDetail() {
        
        leadingConstraint.constant = isShowingDetails ? 2 * view.frame.maxX : view.frame.maxX - 40
        centerConstraintText.constant = isShowingDetails ? 0 : -view.frame.midY + 20
        
        isShowingDetails.toggle()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            
            // Retorna ao estado inicial
            if !self.isShowingDetails {
                self.leadingConstraint.constant = 0
            }
        }
    }
    
    func setupConstraints() {
        
        leadingConstraint = animatedView.trailingAnchor.constraint(equalTo: view.leadingAnchor)
        centerConstraintText = showDetailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor )
        
        NSLayoutConstraint.activate([
            leadingConstraint,
            animatedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            centerConstraintText,
            showDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showDetailButton.widthAnchor.constraint(equalToConstant: 200),
            showDetailButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

#Preview {
    ViewControllerToPreview { HorizontalSlideAnimationConstraintViewController.self }
}
