//
//  TransitionScaleAnimationViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 13/05/24.
//

import UIKit
import SwiftUI

class TransitionScaleAnimationViewController: UIViewController {
    
    var widthImageViewConstraint: NSLayoutConstraint!
    var heightImageViewConstraint: NSLayoutConstraint!
    var centerYShowDetailButtonConstraint: NSLayoutConstraint!
    
    var isScale: Bool = false
    
    let showDetailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Alternar Escala", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let uiImageView: UIImageView = {
        let image: UIImage = .init(systemName: "heart.fill")!
        let imageView: UIImageView = .init(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(showDetailButton)
        view.addSubview(uiImageView)
        
        showDetailButton.addTarget(self, action: #selector(didTapShowDetail), for: .touchUpInside)
        
        
        setupConstraints()
        
        
    }
    
    @objc func didTapShowDetail(){

        widthImageViewConstraint.constant = isScale ? 50 : 100
        heightImageViewConstraint.constant = isScale ? 50 : 100
        centerYShowDetailButtonConstraint.constant = isScale ? 0 : -50
        
        UIView.animate(withDuration: 0.7, delay: 0, options: [.curveEaseInOut]) {
            self.view.layoutIfNeeded()
        }
        isScale.toggle()
    }
    
    func setupConstraints() {
        
        widthImageViewConstraint = uiImageView.widthAnchor.constraint(equalToConstant: 50)
        heightImageViewConstraint = uiImageView.heightAnchor.constraint(equalToConstant: 50)
        centerYShowDetailButtonConstraint = showDetailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        
        NSLayoutConstraint.activate([
            centerYShowDetailButtonConstraint,
            showDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            uiImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiImageView.topAnchor.constraint(equalTo: showDetailButton.bottomAnchor),
            widthImageViewConstraint,
            heightImageViewConstraint
        ])
    }
}

#Preview {
    ViewControllerToPreview { TransitionScaleAnimationViewController.self }
}

// fazer o efeito de colocar um pouco mais pra cima vai ser doideira
