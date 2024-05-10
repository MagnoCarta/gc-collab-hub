//
//  HorizontalDeslizeAnimationConstraintViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 10/05/24.
//

import UIKit
import SwiftUI

class HorizontalDeslizeAnimationConstraintViewController: UIViewController {
    var leadingConstraint: NSLayoutConstraint!
    var centerConstraintText: NSLayoutConstraint!
    var isShowingDetails: Bool = false
    
    let animatedView: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mostrar Detalhes", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animatedView)
        view.addSubview(textButton)
        
        textButton.addTarget(self, action: #selector(animateView), for: .touchUpInside)

        setupConstraints()
    }

    @objc func animateView() {
        
        if(isShowingDetails){
            leadingConstraint.constant = 2 * view.frame.maxX
            centerConstraintText.constant = 0
        }else {
            leadingConstraint.constant = view.frame.maxX - 20
            centerConstraintText.constant = -view.frame.midY + 20
        }
        
        isShowingDetails.toggle()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {

            self.view.layoutIfNeeded()
            
        }completion: { _ in

            // Retorna ao estado inicial
            if(!self.isShowingDetails) {
                self.leadingConstraint.constant = 0
            }
        }
    }

    func setupConstraints() {
        
        leadingConstraint = animatedView.trailingAnchor.constraint(equalTo: view.leadingAnchor)
        centerConstraintText = textButton.centerYAnchor.constraint(equalTo: view.centerYAnchor )
        
        NSLayoutConstraint.activate([
            leadingConstraint,
            animatedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            animatedView.widthAnchor.constraint(equalToConstant: 350),
            animatedView.heightAnchor.constraint(equalToConstant: 700)
        ])
        
        NSLayoutConstraint.activate([
            centerConstraintText,
            textButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textButton.widthAnchor.constraint(equalToConstant: 200),
            textButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

#Preview {
    ViewControllerToPreview { HorizontalDeslizeAnimationConstraintViewController.self }
}
